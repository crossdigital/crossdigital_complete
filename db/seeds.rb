# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Card.destroy_all
Word.destroy_all
Participant.destroy_all
Game.destroy_all

%w[
    AFRICA AGENT AIR ALIEN ALPS AMAZON AMBULANCE AMERICA ANGEL ANTARCTICA APPLE ARM ATLANTIS AUSTRALIA AZTEC
    BACK BALL BAND BANK BAR BARK BAT BATTERY BEACH BEAR BEAT BED BEIJING BELL BELT BERLIN BERMUDA BERRY BILL BLOCK BOARD BOLT BOMB BOND BOOM BOOT BOTTLE BOW BOX BRIDGE BRUSH BUCK BUFFALO BUG BUGLE BUTTON
    CANADA CAP CAPITAL CAR CARD CARROT CASINO CAST CAT CELL CENTAUR CENTER CHAIR CHANGE CHARGE CHECK CHEST CHICK CHINA CHOCOLATE CHURCH CIRCLE CLIFF CLOAK CLUB CODE COLD COMIC COMPOUND CONCERT CONDUCTOR CONTRACT COOK COPPER COTTON COURT COVER CRANE CRASH CRICKET CROSS CROWN CYCLE CZECH
    DANCE DATE DAY DEATH DECK DEGREE DIAMOND DICE DINOSAUR DISEASE DOCTOR DOG DRAFT DRAGON DRESS DRILL DROP DUCK DWARF
    EAGLE EGYPT EMBASSY ENGINE ENGLAND EUROPE EYE
    FACE FAIR FALL FAN FENCE FIELD FIGHTER FIGURE FILE FILM FIRE FISH FLUTE FLY FOOT FORCE FOREST FORK FRANCE
    GAME GAS GENIUS GERMANY GHOST GIANT GLASS GLOVE GOLD GRACE GRASS GREECE GREEN GROUND
    HAM HAND HAWK HEAD HEART HELICOPTER HIMALAYAS HOLE HOLLYWOOD HONEY HOOD HOOK HORN HORSE HORSESHOE HOSPITAL HOTEL
    ICE CREAM INDIA IRON IVORY
    JACK JAM JET JUPITER
    KANGAROO KETCHUP KEY KID KING KIWI KNIFE KNIGHT
    LAB LAP LASER LAWYER LEAD LEMON LEPRECHAUN LIFE LIGHT LIMOUSINE LINE LINK LION LITTER LOCH NESS LOCK LOG LONDON LUCK
    MAIL MAMMOTH MAPLE MARBLE MARCH MASS MATCH MERCURY MEXICO MICROSCOPE MILLIONAIRE MINE MINT MISSILE MODEL MOLE MOON MOSCOW MOUNT MOUSE MOUTH MUG
    NAIL NEEDLE NET NEW YORK NIGHT NINJA NOTE NOVEL NURSE NUT
    OCTOPUS OIL OLIVE OLYMPUS OPERA ORANGE ORGAN
    PALM PAN PANTS PAPER PARACHUTE PARK PART PASS PASTE PENGUIN PHOENIX PIANO PIE PILOT PIN PIPE PIRATE PISTOL PIT PITCH PLANE PLASTIC PLATE PLATYPUS PLAY PLOT POINT POISON POLE POLICE POOL PORT POST POUND PRESS PRINCESS PUMPKIN PUPIL PYRAMID
    QUEEN
    RABBIT RACKET RAY REVOLUTION RING ROBIN ROBOT ROCK ROME ROOT ROSE ROULETTE ROUND ROW RULER
    SATELLITE SATURN SCALE SCHOOL SCIENTIST SCORPION SCREEN SCUBA DIVER SEAL SERVER SHADOW SHAKESPEARE SHARK SHIP SHOE SHOP SHOT SINK SKYSCRAPER SLIP SLUG SMUGGLER SNOW SNOWMAN SOCK SOLDIER SOUL SOUND SPACE SPELL SPIDER SPIKE SPINE SPOT SPRING SPY SQUARE STADIUM STAFF STAR STATE STICK STOCK STRAW STREAM STRIKE STRING SUB SUIT SUPERHERO SWING SWITCH
    TABLE TABLET TAG TAIL TAP TEACHER TELESCOPE TEMPLE THEATER THIEF THUMB TICK TIE TIME TOKYO TOOTH TORCH TOWER TRACK TRAIN TRIANGLE TRIP TRUNK TUBE TURKEY
    UNDERTAKER UNICORN
    VACUUM VAN VET
    WAKE WALL WAR WASHER WASHINGTON WATCH WATER WAVE WEB WELL WHALE WHIP WIND WITCH WORM
    YARD

].each do |word|
    Word.create!(name: word)
end

g1 = Game.create!(name: "Game 1")
g1.participants.create(name: "RedOP", team: 'red', role: 'operative')
g1.participants.create(name: "BlueOPP", team: 'blue', role: 'operative')
g1.participants.create(name: "RedSpy", team: 'red', role: 'spymaster')
g1.participants.create(name: "BlueSpy", team: 'blue', role: 'spymaster')

