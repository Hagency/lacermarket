class Content < ActiveRecord::Base
   extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

	belongs_to :user
    
    has_many :sales


	 has_attached_file :cover, styles: { medium: "300x>", thumb: "100x>" }
     validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/,
     message: "solo le immagini sono supportate"
     has_attached_file :allegato
    validates_attachment_content_type :allegato, :content_type => [ /^image\/(png|gif|jpeg)/,'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','audio/mpeg', 'audio/mp3' ],
    message: "Formato non supportato"
    validates :title, :description, :price, presence: true
    validates :price, numericality: { greater_than: 49}
    validates :cover, attachment_presence: true
    validates :allegato, attachment_presence: true
end
