class GOATCLI::CLI


  def call
    starting_5 = {:point_guard=> "", :shooting_guard=> "", :small_forward=> "", :power_forward=> "", :center=> ""}


    positions



    compare

    puts "Which player would you add to your starting 5? Or do you want to keep on comparing?"

    puts <<-DOC
      starting_5 = {
        :point_guard => Magic Johnson,
        :shooting_guard => Michael Jordan,
        :small_forward => Lebron James,
        :power_forward => Tim Duncan,
        :center => Shaq
      }
    DOC
  end

  def positions
    puts <<-DOC
      1.list point guards
      2.list shooting guards
      3.list small forwards
      4.list power forwards
      5.list centers
    DOC
  end

  def compare
    puts "Enter the first player you would you like to compare?"
    input = gets.strip
    puts "Enter the second player you would like to compare?"
    input2 = gets.strip
    input = puts <<-DOC
    1.player_1.stats   2.player_2.stats
    DOC
    input
  end

  def add_to_team
    starting_5
  end

  def stats
    puts "Enter the players you want to compare"
    puts <<-DOC
    1. Magic Johnson.stats   2.Chris Paul.stats
    DOC
  end

end
