class CustomCell < UITableViewCell
	HORIZONTAL_MARGIN = 10
	VERTICAL_MARGIN = 4

	attr_accessor :mainTextLabel, :subTextLabel

	def initWithStyle(style, reuseIdentifier:reuseIdentifier)
		if super	
			addMainLabel
			addSubLabel
			setupBackground
		end

		self
	end

	def layoutSubviews
		super	

		text_size = @mainTextLabel.text.sizeWithFont(@mainTextLabel.font)
		x, y			= HORIZONTAL_MARGIN, VERTICAL_MARGIN
		width			= text_size.width
		height		= self.contentView.frame.size.height - (2 * VERTICAL_MARGIN)
		@mainTextLabel.frame = [[x,y],[width,height]]

		text_size = @subTextLabel.text.sizeWithFont(@subTextLabel.font)
		x					+= width + HORIZONTAL_MARGIN
		width			= text_size.width
		
		@subTextLabel.frame = [[x,y],[width,height]]
	end

	def setSelected(selected, animated:animated)
		super	
	end

	def setHighlighted(highlighted, animated:animated)
		super	
		shadow_offset = highlighted ? [0,0] : [0,1]

		@mainTextLabel.shadowOffset = shadow_offset
		@subTextLabel.shadowOffset = shadow_offset
	end

	private

	def addMainLabel
		@mainTextLabel = UILabel.alloc.init
		@mainTextLabel.font = UIFont.boldSystemFontOfSize(16)
		@mainTextLabel.textColor = UIColor.colorWithWhite(0.45, alpha:1.0)
		@mainTextLabel.shadowColor = UIColor.whiteColor
		@mainTextLabel.shadowOffset = [0, 1]
		@mainTextLabel.backgroundColor = UIColor.clearColor
		@mainTextLabel.highlightedTextColor = UIColor.whiteColor

		self.contentView.addSubview(@mainTextLabel)
	end

	def addSubLabel
		@subTextLabel = UILabel.alloc.init
		@subTextLabel.font = UIFont.systemFontOfSize(14)
		@subTextLabel.textColor = UIColor.colorWithWhite(0.55, alpha:1.0)
		@subTextLabel.shadowColor = UIColor.whiteColor
		@subTextLabel.shadowOffset = [0, 1]
		@subTextLabel.backgroundColor = UIColor.clearColor
		@subTextLabel.highlightedTextColor = UIColor.whiteColor

		self.contentView.addSubview(@subTextLabel)
	end

	def setupBackground
		background = UIImage.imageNamed("cell-bg.png")
		background_view = UIImageView.alloc.initWithImage(background)
		self.backgroundView = background_view

		highlight = UIImage.imageNamed("cell-bg-highlighted")
		highlight_view = UIImageView.alloc.initWithImage(highlight)
		self.selectedBackgroundView = highlight_view
	end

end
