#-------------------------- instructions start --------------------------#
# Playwright::all
# Playwright::find_by_name(name)
# Playwright#new (this is the initialize method)
# Playwright#create
# Playwright#update
# Playwright#get_plays (returns all plays written by playwright)
# Remember, our PlayDBConnection class accesses the database stored in plays.db, which includes both the plays and playwrights tables.
#-------------------------- instructions end --------------------------#

require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year
  def self.all
    data = PlayDBConnection.instance.execute('SELECT * FROM playwrights')
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(playwright)
    PlayDBConnection.instance.execute(<<-SQL, playwright)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name=?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end


  def update
    raise "#{self} already in database" if self.id
    # PlayDBConnection.instance.execut(<<-SQL, self.id, self.name, self.birth_year)
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        playwrights
      SET
        name=?, birth_year=?
      WHERE
        id=?
    SQL

  end

  # Playwright#get_plays (returns all plays written by playwright)
  def get_plays
    PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT *
      FROM plays
      WHERE playwright_id=?
    SQL
  end
end
