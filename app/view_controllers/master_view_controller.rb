class MasterViewController < UITableViewController
  CELLID = "CustomCell"

  def dateFormatter
    @dateFormatter ||= NSDateFormatter.alloc.init
    @dateFormatter.dateFormat = "dd MMM YYYY"
    @dateFormatter
  end

  def viewDidLoad
    color = UIColor.colorWithRed(0.650, green:0.222, blue:0.750, alpha:1.000)
    background_color = UIColor.colorWithWhite(0.25, alpha:1.0)

    self.title = "Custom Cells"
    self.navigationController.navigationBar.tintColor = color

    self.tableView.backgroundColor = background_color
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone
    self.tableView.registerClass(CustomCell, forCellReuseIdentifier:CELLID)
  end

  def tableView(tableView, numberOfRowsInSection:secton)
    100
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    44
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    interval = (60 * 60 * 24) * indexPath.row
    date = NSDate.date.dateByAddingTimeInterval(interval)

    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) 
    cell.mainTextLabel.text = self.dateFormatter.stringFromDate(date)
    cell.subTextLabel.text = "#{rand(999).to_s} items"

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)    
  end

end
