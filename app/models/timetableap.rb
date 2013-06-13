class Timetableap < ActiveRecord::Base
  belongs_to :aircompany
  # belongs_to :airport,
    # :foreign_key => "way_start"
	# :foreign_key => "way_end"
  cattr_reader :per_page
  @@per_page = 50
  attr_accessible :aircompany_id, :DateOfEndNav, :DateOfStartNav, :Flight_Number, :GateEnd, :GateStart, :TermEnd, :TermStart, :TimeEnd, :TimeStart, :TypeOfPlane, :e0, :e1, :e2, :e3, :e4, :e5, :e6, :s0, :s1, :s2, :s3, :s4, :s5, :s6, :way_end, :way_start
end
