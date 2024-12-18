-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2023 at 01:23 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogfoodster`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `idAnswer` int(255) NOT NULL,
  `answerText` varchar(255) NOT NULL,
  `idSurvey` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`idAnswer`, `answerText`, `idSurvey`) VALUES
(1, 'Desserts', 1),
(2, 'Healthy food', 1),
(3, 'Fast food', 1),
(4, '', 2),
(5, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `answerssurvey`
--

CREATE TABLE `answerssurvey` (
  `idAnswerSurvey` int(255) NOT NULL,
  `idAnswer` int(255) NOT NULL,
  `idSurvey` int(255) NOT NULL,
  `idUser` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `idCategory` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`idCategory`, `name`, `img`) VALUES
(1, 'Lunch Ideas', 'lunch-ideas.jpg'),
(2, 'Healthy', 'healthy.jpg'),
(3, 'Desserts', 'desserts.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `idComment` int(255) NOT NULL,
  `text` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idUser` int(255) NOT NULL,
  `idPost` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`idComment`, `text`, `date`, `idUser`, `idPost`) VALUES
(1, 'I love your recipes so much! Made this last night and everyone loved it!', '2023-03-16 00:12:03', 2, 2),
(2, 'This is the best thing ever. I tried many recipes but yours is definitely the best!', '2023-03-16 00:12:59', 5, 9),
(3, 'Have to try this ASAP! It looks so good! Your recipes are soooooo goood!', '2023-03-16 00:14:06', 3, 1),
(4, 'Can\'t wait to try this! All your recipes are amazing. Thank you for sharing!', '2023-03-14 16:51:47', 4, 3),
(5, 'Made this recently and I love the balance of flavours! It was so good. Everyone adored it!', '2023-03-16 00:15:50', 6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `idMessage` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`idMessage`, `title`, `message`, `email`, `date`) VALUES
(1, 'Message', 'Love your recipes a lot!', 'marijanamilanovic8@gmail.com', '2023-03-13 22:07:43'),
(2, 'Message', 'You\'re really helping! Thank you for your recipes.', 'paulwesley@gmail.com', '2023-03-13 22:07:50'),
(3, 'Message', 'What is your favorite meal to make?', 'vanjamaksimovic@gmail.com', '2023-03-13 22:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `nav`
--

CREATE TABLE `nav` (
  `idNav` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `display` int(1) NOT NULL,
  `priority` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nav`
--

INSERT INTO `nav` (`idNav`, `name`, `path`, `display`, `priority`) VALUES
(1, 'Home', 'index.php', 0, 1),
(2, 'About', 'about.php', 0, 5),
(3, 'Recipes', 'recipes.php', 0, 10),
(4, 'Contact', 'contact.php', 0, 15),
(5, 'Log In', 'login.php', 3, 20),
(6, 'Register', 'register.php', 3, 25),
(7, 'Log Out', 'logout.php', 1, 25),
(8, 'Admin panel', 'admin.php', 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `idPost` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `imgSrc` varchar(255) NOT NULL,
  `openingText` text NOT NULL,
  `idCategory` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`idPost`, `name`, `text`, `date`, `imgSrc`, `openingText`, `idCategory`) VALUES
(1, 'Creamy Pasta With Mushrooms (Pasta ai Funghi) Recipe', 'Ingredients\r\n1 cup (240ml) homemade or store-bought low-sodium chicken stock (see note)\r\n1 1/2 teaspoons (4g) powdered gelatin, such as Knox\r\n2 tablespoons (30ml) extra-virgin olive oil\r\n1 1/2 pounds (675g) mixed mushrooms (such as shiitake, oyster, maitake, beech, cremini, and chanterelles), cleaned, trimmed, and thinly sliced or torn by hand (see note)\r\nKosher salt and freshly ground black pepper\r\n3 medium shallots, finely minced (about 3/4 cup; 120g)\r\n2 medium (10g) garlic cloves, minced\r\n2 tablespoons (4g) chopped fresh thyme leaves\r\n1/2 cup (120ml) dry white wine or 1/4 cup (60ml) dry sherry\r\n1 teaspoon (5ml) fish sauce (optional)\r\n1 pound (450g) short dried pasta (such as casarecce or gemelli) or long fresh egg-dough pasta (such as tagliatelle or fettuccine)\r\n6 tablespoons unsalted butter (3 ounces; 85g)\r\n3 ounces grated Parmigiano-Reggiano (1 cup; 85g)\r\n1/4 cup (10g) chopped fresh flat-leaf parsley leaves\r\n\r\nDirections\r\n1. Pour stock into a small bowl or liquid measuring cup and evenly sprinkle gelatin over surface of stock. Set aside.\r\n\r\n2. In a large 12-inch cast iron or stainless steel skillet, heat oil over medium-high heat until shimmering. Add mushrooms, season with salt and pepper, and cook, stirring frequently with a wooden spoon, until moisture has evaporated and mushrooms are deeply browned, 12 to 15 minutes.\r\n\r\n3. Add shallots, garlic, and thyme and cook, stirring constantly, until fragrant and shallots are softened, 30 seconds to 1 minute. Add wine or sherry, and cook, swirling pan and scraping up any stuck-on bits with a wooden spoon, until wine is reduced by half, about 30 seconds.\r\n\r\n4. Add chicken stock mixture, season lightly with salt, and bring to a simmer. Reduce heat to medium-low, add fish sauce (if using), and cook, stirring occasionally, until mushroom mixture is thickened to a saucy consistency, about 5 minutes. Turn off heat.\r\n\r\n5. Meanwhile, in a pot of salted boiling water, cook pasta. If using dry pasta, cook until just shy of al dente (1 to 2 minutes less than the package directs). If using fresh pasta, cook until noodles are barely cooked through. Using either a spider skimmer (for short pasta) or tongs (for long fresh pasta), transfer pasta to pan with mushrooms along with 3/4 cup (180ml) pasta cooking water. Alternatively, drain pasta using a colander or fine-mesh strainer, making sure to reserve at least 2 cups (475ml) pasta cooking water.\r\n\r\n6. Heat sauce and pasta over high and cook, stirring and tossing rapidly, until pasta is al dente (fresh pasta will never be truly al dente) and sauce is thickened and coats noodles, 1 to 2 minutes, adding more pasta cooking water in 1/4 cup (60ml) increments as needed. At this point, the sauce should coat the pasta but still be loose enough to pool around the edges of the pan. Add butter, and stir and toss rapidly to melt and emulsify into the sauce. Remove from heat, add 3/4 of grated cheese and all of the parsley, and stir rapidly to incorporate. Season with salt to taste. Serve immediately, passing remaining grated cheese at the table.', '2023-03-15 21:26:00', 'pasta.jpg', 'Shallots, garlic, white wine, and Parmesan bring out the earthy flavors of mushrooms in this comforting all-weather pasta.', 1),
(2, 'The Best Crispy Roast Potatoes Ever Recipe', 'Ingredients\r\nKosher salt\r\n1/2 teaspoon (4g) baking soda\r\n4 pounds (about 2 kg) russet or Yukon Gold potatoes, peeled and cut into quarters, sixths, or eighths, depending on size (see note)\r\n5 tablespoons (75ml) extra-virgin olive oil, duck fat, goose fat, or beef fat\r\nSmall handful picked fresh rosemary leaves, finely chopped\r\n3 medium cloves garlic, minced\r\nFreshly ground black pepper\r\nSmall handful fresh parsley leaves, minced\r\n\r\nDirections\r\n1. Adjust oven rack to center position and preheat oven to 450°F (230°C) (or 400°F (200°C) if using convection). Heat 2 quarts (2L) water in a large pot over high heat until boiling. Add 2 tablespoons kosher salt (about 1 ounce; 25g), baking soda, and potatoes and stir. Return to a boil, reduce to a simmer, and cook until a knife meets little resistance when inserted into a potato chunk, about 10 minutes after returning to a boil.\r\n\r\n2. Meanwhile, combine olive oil, duck fat, or beef fat with rosemary, garlic, and a few grinds of black pepper in a small saucepan and heat over medium heat. Cook, stirring and shaking pan constantly, until garlic just begins to turn golden, about 3 minutes. Immediately strain oil through a fine-mesh strainer set in a large bowl. Set garlic/rosemary mixture aside and reserve separately.\r\n\r\n3. When potatoes are cooked, drain carefully and let them rest in the pot for about 30 seconds to allow excess moisture to evaporate. Transfer to bowl with infused oil, season to taste with a little more salt and pepper, and toss to coat, shaking bowl roughly, until a thick layer of mashed potato–like paste has built up on the potato chunks.\r\n\r\n4. Transfer potatoes to a large rimmed baking sheet and separate them, spreading them out evenly. Transfer to oven and roast, without moving, for 20 minutes. Using a thin, flexible metal spatula to release any stuck potatoes, shake pan and turn potatoes. Continue roasting until potatoes are deep brown and crisp all over, turning and shaking them a few times during cooking, 30 to 40 minutes longer.\r\n\r\n5. Transfer potatoes to a large bowl and add garlic/rosemary mixture and minced parsley. Toss to coat and season with more salt and pepper to taste. Serve immediately.\r\n', '2023-03-15 21:28:29', 'crispy-potatoes.jpg', 'These are the most flavorful crispy roast potatoes you\'ll ever make. And they just happen to be gluten-free and vegan (if you use oil) to boot.', 1),
(3, 'Choux au Craquelin Recipe', 'Ingredients\r\n4 ounces (1/2 cup; 115g) light brown sugar\r\n4 ounces (1 stick; 115g) unsalted butter, cut into 1/2-inch cubes, and softened to about 68°F (20°C)\r\n4 ounces (about 1 scant cup; 115g) all-purpose flour, sifted\r\n1/8 teaspoon Diamond Crystal kosher salt; for table salt, use half as much by volume\r\nOne recipe Choux Pastry (made with water), transferred to a pastry bag fitted with a 1/2-inch plain round tip\r\nOne recipe vanilla, chocolate, or lemon pastry cream, or one recipe crème légère, transferred to a pastry bag fitted with a 1/4-inch plain round tip \r\n\r\nDirections\r\n1. To Make the Craquelin Top by Hand: In a medium bowl and using a flexible spatula, mash together brown sugar and butter, then stir until smooth and creamy, about 3 minutes.\r\n\r\n2. Add flour and salt, thoroughly mixing until no dry flour remains and a damp, crumbly meal has formed, about 2 minutes.\r\n\r\n3. Alternatively, to Make the Craquelin Top in a Stand Mixer: In the bowl of a stand mixer fitted with the paddle attachment, beat the brown sugar and butter on medium speed until smooth and creamy, about 2 minutes.\r\n\r\n4. Scrape down the bowl and beater with a flexible spatula. Add flour and salt, then beat on medium-low speed until no dry flour remains and a damp, crumbly meal has formed, about 2 minutes.\r\n\r\n5. Using your hands, bring dough together to form a ball (it will be a bit sticky but do not add extra flour). Place a sheet of parchment paper on a work surface and set dough on top. Shape dough into a roughly 6- by 8-inch flat rectangle.\r\n\r\n6. Cover with a second sheet of parchment paper. Using a rolling pin, roll out dough into a 1/8-inch-thick rough rectangle 1/8 inch thick (it should be about 12-by-14 inches in size); reposition both sheets of parchment paper as needed to minimize creasing. Transfer dough, along with parchment paper, to a rimmed baking sheet and freeze until cold, about 5 minutes (or refrigerate until cold, about 15 minutes). Meanwhile, line a second baking sheet with parchment paper.\r\n\r\n7. Remove top sheet of parchment paper. Using a 2-inch round cutter, stamp out 18 pieces of craquelin. Working quickly, transfer craquelin rounds to the prepared baking sheet in a single layer, and return to freezer; you may need to slide an offset spatula under the cut-outs to loosen them from the parchment paper. If desired, craquelin dough scraps can be re-rolled out, chilled, and cut into new rounds (see Make Ahead section for more on holding extra, uncooked rounds).\r\n\r\n8. Adjust oven racks so that one is in upper-middle position, the other is in lower-middle position, and preheat oven to 375°F (191°C). Line two aluminum baking sheets with parchment paper. Pipe a small amount of choux paste under each corner of parchment paper (the dough acts as a glue and keeps the paper in place as you pipe).\r\n\r\n9. Holding the filled pastry bag at a 90° angle, apply steady downward pressure and pipe a 2-inch-wide choux (see note). To stop piping, cease applying pressure and swirl pastry tip away. Continue to pipe choux about 3 inches apart, for a total of 9 choux. Repeat with second tray. Top each choux with a craquelin cut-out, making sure it’s positioned parallel to the floor of the baking sheet, then press down slightly to ensure it adheres to the highest point of the piped choux. Bake both trays, switching racks and rotating trays front to back after 20 minutes, until choux au craquelin are puffed, deeply golden brown, and feel hollow when lifted, about 30 minutes total. For sandwich-style choux au craquelin, proceed to the next step; for piped-in choux au craquelin, proceed to step 11.\r\n\r\n10. To Fill Sandwich-Style Choux au Craquelin: Turn off oven. Let trays rest in oven with oven door partially open for 30 minutes. Remove from oven and let cool completely, about 15 minutes. Using a serrated knife, slice each puff in half to create a top and bottom \"bun.” Transfer your choice of filling (see notes section below for filling instructions) to a pastry bag fitted with a 3/4-inch star tip. Working with one at a time, begin piping with steady pressure to generously fill the bottom half of each choux. Cover with the top half of each choux. Repeat until all choux au craquelin are filled. Serve immediately.\r\n\r\n11. To Fill Piped-In Choux au Craquelin: Working quickly, while choux au craquelin are still hot, gently insert the tip of a paring knife into the underside of each choux and rotate in a circular motion to create a small hole about 1/4 inch in size, then return to tray. Set both trays in the turned-off but still warm oven with the door partially open for 30 minutes. Remove from oven and let cool completely, about 15 minutes.\r\n\r\n12. Working with one at a time, insert tip of pastry cream–filled bag into hole in each choux and begin piping with steady pressure until filled (you can tell because the choux will feel heavy and pastry cream will start to overflow the hole). Wipe away any excess pastry cream. Repeat until all choux au craquelin are filled. Serve immediately.', '2023-03-12 19:46:24', 'choux.jpg', 'Choux au craquelin—dressed-up pâte à choux filled with pastry cream—are a delicious sweet treat.', 3),
(4, 'Bacon, Egg, and Cheese Breakfast Burrito Recipe', 'Ingredients\r\n4 large eggs\r\nKosher salt\r\n1/4 cup (60ml) canola, vegetable, or other neutral oil\r\n1 pound (450g) Russet potatoes (about 2 medium potatoes), peeled and cut into 1/2-inch dice\r\n1/2 medium (8-ounce; 225g) yellow onion, cut into 1/2-inch dice\r\nFreshly ground black pepper\r\n1 tablespoon (15g) unsalted butter\r\n4 rashers crisply cooked bacon, broken into pieces\r\n2 ounces (55g) shredded cheddar cheese\r\n2 large (10-inch) flour tortillas, warmed through on a dry griddle or cast iron pan\r\n2 tablespoons (1 ounce; 30g) sour cream, divided\r\n1/4 cup (2 ounces; 55g) guacamole, divided\r\nHot sauce of your choice (optional)\r\n\r\nDirections\r\n1. In a medium bowl, whisk eggs with a large pinch of salt until homogenous and no visible egg whites remain. Set aside.\r\n\r\n2. In a medium cast iron or stainless steel skillet, heat oil over medium-high heat until shimmering. Add potatoes, season with salt, and cook, stirring only occasionally, until beginning to brown, about 8 minutes. Lower heat to medium, stir in onion, and continue to cook, stirring occasionally to prevent scorching, until potatoes are golden and crisp and onions are browned and tender, about 10 minutes longer. Season with additional salt and pepper to taste and set aside.\r\n\r\n3. In a medium nonstick skillet, melt butter over medium heat until foaming. Add eggs and cook, stirring constantly with a rubber spatula, until eggs have formed curds but are still runny, 1 to 2 minutes. Stir in cheese and continue to cook, stirring constantly, until cheese is melted and eggs are soft and fluffy, about 1 minute longer. Remove from heat.\r\n\r\n4. Working with one just-warmed tortilla at a time, lay tortilla on a work surface. Spread 1 tablespoon (15g) sour cream in a thin, even layer on center of tortilla, leaving about 2 inches of border on either side and 3 inches of border above and below. Top with 2 tablespoons (30g) guacamole and spread it around on top of the sour cream. Arrange half the bacon on top of the guacamole.\r\n\r\n5. Pile half the potatoes on top of the bacon, followed by half the eggs and cheese. Douse with as much hot sauce as you want.\r\n\r\n6. Fold the tortilla sides in over the filling. Then roll the bottom flap of tortilla up over the filling, holding the sides tight as you roll. Continue rolling until the burrito is sealed. Repeat with remaining tortilla and filling ingredients. Serve right away.', '2023-03-15 21:30:04', 'burrito.jpg', 'Soft scrambled eggs, melted cheddar cheese, crisply browned potato hash, guac, sour cream, hot sauce, and bacon, all piled into a tender flour tortilla.', 1),
(5, 'The Best Caesar Salad Recipe', 'Ingredients\r\n3 tablespoons plus 1/4 cup (105ml) extra-virgin olive oil, divided\r\n2 medium cloves garlic, minced (about 2 teaspoons)\r\n3 cups hearty bread, cut into 3/4-inch cubes\r\n2 ounces finely grated Parmesan cheese (about 1 cup), divided\r\nKosher salt and freshly ground black pepper\r\n1 large egg yolk (see note)\r\n1 tablespoon (15ml) juice from 1 lemon\r\n2 to 6 anchovies (see note)\r\n1 teaspoon (5ml) Worcestershire sauce (see note)\r\n1/3 cup (80ml) canola oil\r\n2 heads romaine lettuce, inner leaves only, washed and carefully dried, large leaves torn into smaller pieces, smaller leaves left intact\r\n\r\nDirections\r\n1. Adjust oven rack to middle position and preheat oven to 375°F (190°C). In a small bowl, combine 3 tablespoons (45ml) olive oil with minced garlic and whisk for 30 seconds. Transfer to a fine-mesh strainer set over a large bowl and press with the back of a spoon to extract as much oil as possible, leaving garlic behind. Reserve pressed garlic separately. Add bread cubes to garlic oil and toss to coat.\r\n\r\n2. Add 2 tablespoons Parmesan cheese, toss again, and season to taste with salt and pepper. Transfer to a rimmed baking sheet. Bake until croutons are pale golden brown and crisp, about 15 minutes. Remove from oven and toss with 2 more tablespoons Parmesan. Allow to cool.\r\n\r\n3. While croutons bake, make the dressing. Combine egg yolk, lemon juice, anchovies, Worcestershire sauce, pressed garlic, and 1/4 cup Parmesan cheese in the bottom of a cup that just fits the head of an immersion blender or in the bottom of a food processor. With blender or processor running, slowly drizzle in canola oil until a smooth emulsion forms. Transfer mixture to a medium bowl. Whisking constantly, slowly drizzle in remaining 1/4 cup (60ml) extra-virgin olive oil. Season to taste generously with salt and pepper.\r\n\r\n4. To serve, toss lettuce with a few tablespoons of dressing, adding more if desired. Once lettuce is coated, add half of remaining cheese and three-quarters of croutons and toss again. Transfer to a salad bowl and sprinkle with remaining cheese and croutons. Serve.', '2023-03-15 21:34:03', 'caesar.jpg', 'The crowd-pleasing salad of crisp romaine leaves, crunchy croutons, and a little or a lot of anchovy, as you like.', 1),
(6, 'Sunny Lemon Bars Recipe', 'Ingredients\r\n\r\nFor the Crust:\r\n4 1/2 ounces (1 cup; 130g) all-purpose flour\r\n2 ounces (1/2 cup; 60g) powdered sugar, preferably organic\r\n1/4 teaspoon (1g) Diamond Crystal kosher salt; for table salt, use the same weight or half as much by volume\r\n1/8 ounce (1 tablespoon; 4g) freshly grated lemon zest\r\n4 ounces (1 stick; 115g) cold unsalted butter, cut into 1/4-inch dice\r\n\r\nFor the Custard:\r\n9 1/2 ounces (1 1/3 cups; 270g) granulated sugar\r\n3 large eggs, cold\r\n4 3/4 ounces (1/2 cup; 135g) egg yolks, from about 8 large eggs\r\n1/4 ounce (1 packed tablespoon; 8g) freshly grated lemon zest\r\nPinch of kosher salt\r\n11 ounces (1 1/3 cups; 310g) lemon juice, from about 8 large lemons\r\n\r\nFor Garnishing:\r\n2 ounces (1/2 cup; 55g) powdered sugar (optional)\r\n6 ounces (1 cup; 170g) lemon chantilly (optional)\r\n5 ounces (1 cup; 140g) crispy citrus-candied pistachios (optional)\r\n\r\nDirections\r\n1. For the Crust: Adjust oven rack to middle position, preheat oven to 350°F (180°C), and line an 8- by 8- by 2-inch anodized-aluminum baking pan with a piece of parchment paper long enough to overhang the pan\'s edges. Combine flour, powdered sugar, salt, lemon zest, and butter in the bowl of a food processor; pulse to form a dry but pebbly meal, about 12 one-second pulses. Scatter into the prepared baking pan, press into an even layer, and bake until pale gold and firm, about 30 minutes. Use hot or set aside until needed, up to 48 hours at room temperature if tightly covered.\r\n\r\n2. For the Custard: Combine sugar, whole eggs, yolks, lemon zest, and salt in a 3-quart stainless steel saucepan, then whisk in lemon juice. Cook over low heat, stirring constantly but not vigorously, until warm to the touch, about 3 minutes. Increase heat to medium-low and continue cooking and stirring until thick and steaming-hot (custard should register 170°F (77°C) on an instant-read thermometer), about 8 minutes. Immediately strain into the prepared crust, smooth into an even layer, and cover with aluminum foil. Bake until smooth and firm, about 10 minutes. Remove foil and cool to room temperature, then re-cover and refrigerate until cold and firm, about 1 hour.\r\n\r\n3. To Serve: Loosen chilled custard from sides of pan with a bench or butter knife, then carefully tug loose and lift using overhanging parchment and transfer to a cutting board. Cut into 16 two-inch squares, rinsing the knife clean between each slice. Serve plain, lightly dusted with powdered sugar, or topped with Lemon Chantilly and Crispy Citrus-Candied Pistachios. Store up to 1 week in an airtight container.', '2023-03-12 19:54:52', 'lemon-bars.jpg', 'A cross between lemon curd and lemon meringue pie.', 3),
(7, 'Omelette With Spinach and Cheese Recipe', 'Ingredients\r\n5 large eggs\r\nKosher salt and freshly ground black or white pepper\r\n3 1/2 ounces (100g) grated Gruyère or Swiss cheese\r\n2 tablespoons (30g) unsalted butter, divided\r\n2 medium cloves garlic, minced\r\n1 pound (450g) fresh Savoy spinach, thoroughly washed, or 10 ounces (283g) defrosted frozen spinach\r\n\r\nDirections\r\n1. In a medium bowl, season eggs with salt and pepper, then whisk until homogeneous and frothy. Set aside.\r\n\r\n2. Add cheese to a separate medium heatproof bowl, and line a large plate with a double layer of paper towels. In a 10-inch nonstick skillet, melt 1 tablespoon (15g) butter over medium-high heat. Add garlic and cook, stirring frequently, until garlic is aromatic and just begins to soften, about 30 seconds.\r\n\r\n3. If using fresh spinach: Add spinach to skillet, cover, and cook until just wilted, about 2 minutes (you may have to press down on the spinach with the lid at first to cover, but the spinach will rapidly lose volume as it wilts). Uncover, season with salt and pepper, and stir to combine. Increase heat to medium-high and cook, stirring frequently, until spinach is very soft and most of the liquid it has released has evaporated, about 4 minutes.\r\n\r\n4. If using defrosted frozen spinach: Add spinach to skillet, season with salt and pepper, and stir well to combine. Increase heat to medium-high and cook, uncovered, until excess water has evaporated, about 4 minutes.\r\n\r\n5. Transfer cooked spinach to paper towel-lined plate, roll up in the towels, and squeeze gently to extract any additional excess moisture; discard paper towels and any accumulated liquid. Transfer hot spinach to bowl with cheese.\r\n\r\n6. Wipe out now-empty skillet, and melt remaining 1 tablespoon (15g) butter over medium heat, swirling frequently, until butter is lightly browned. Re-whisk eggs until foamy, then add to skillet and cook, using a silicone spatula to push the edges in toward the center as they set and tilting the pan to spread the uncooked egg underneath. Continue pushing in the edges of the eggs and tilting the skillet, working all around the pan, until omelette is almost set, about 45 seconds.\r\n\r\n7. Sprinkle spinach and cheese mixture over half of omelette, remove from heat, cover, and let omelette sit until mostly or fully cooked through on top (depending on your preferred consistency), about 1 minute.\r\n\r\n8. Using silicone spatula, loosen the edges of the omelette from skillet and shake skillet to ensure that it\'s not stuck. Carefully fold omelette in half to enclose the filling, then slide it onto a serving plate and serve immediately.', '2023-03-15 21:35:59', 'omelette.jpg', 'Five ingredients are all you need for this comforting—and surprisingly robust—breakfast, lunch, or dinner.', 2),
(8, 'Dairy-Free Chocolate Cake Recipe', 'Ingredients\r\n4 ounces light or dark brown sugar (about 1/2 cup, firmly packed; 115g)\r\n1 1/2 ounces high-fat Dutch cocoa (about 1/2 cup; 42g); see our top Dutch cocoa picks for recommendations (see notes)\r\nShy 1/2 teaspoon (1.75g) Diamond Crystal kosher salt; for table salt, use about half as much by volume or the same weight\r\n3/4 teaspoon (4.8g) baking soda\r\n4 1/2 ounces extra-virgin olive oil (about 2/3 cup; 127g)\r\n4 ounces brewed black coffee, or black tea such as Assam (about 1/2 cup; 115g), any temperature\r\n2 large eggs (about 3 1/2 ounces; 100g), straight from the fridge\r\n1/4 ounce vanilla extract (about 1 1/2 teaspoons; 7g)\r\n2 1/2 ounces whole wheat flour, such as Bob\'s Red Mill (about 1/2 cup plus 2 tablespoons; 70g)\r\nOptional garnishes: powdered sugar, preferably organic (see our explainer on organic powdered sugar for more information), or fresh fruit\r\n\r\nDirections\r\n1. Getting Ready: Adjust oven rack to lower-middle position and preheat to 350°F (180°C). Line an 8- by 3-inch anodized aluminum cake pan with parchment (see our explanation and tutorial on how to cut a parchment round) and grease lightly with pan spray.\r\n\r\n2. For the Cake: In a medium mixing bowl, combine brown sugar, Dutch cocoa powder, salt, and baking soda. Whisk until homogeneous, with no visible clumps of cocoa or baking soda (although a few lumps of brown sugar may remain), about 1 minute. Under-mixing will give the cake an uneven texture and rise, so don\'t rush this step.\r\n\r\n3. Whisk in olive oil, brewed coffee, eggs, and vanilla. When mixture is smooth and well emulsified, add whole wheat flour and continue mixing only until combined. Scrape into prepared pan. Bake until cake is firm but your finger can still leave an impression in the puffy crust, about 25 minutes. (A toothpick inserted into the center should come away with a few crumbs still attached.)\r\n\r\n4. Cool cake directly in pan for 1 hour, then run a butter knife around the edges to loosen. Invert onto a wire rack, peel off parchment, and place cake right side up on a serving platter or cake stand. Serve plain, with a sprinkling of powdered sugar, or with fresh fruit.', '2023-03-15 21:37:21', 'chocolate-cake.jpg', 'This simple, weeknight-friendly cake comes together fast—no fancy equipment required!', 2),
(9, 'Guasacaca (Avocado Salsa) Recipe', 'Ingredients\r\n2 ripe Haas avocados, seeded and roughly diced\r\n1 small onion, quartered\r\n1 small green bell pepper, stemmed, seeded, and roughly chopped\r\n1 medium jalapeño, stemmed, seeded, and roughly chopped (optional)\r\n2 medium cloves garlic\r\n1/2 cup packed roughly chopped fresh cilantro leaves\r\n1/4 cup packed roughly chopped fresh parsley leaves\r\n1/4 cup white vinegar\r\n1 tablespoon lime juice from 1 lime\r\n1/3 cup olive oil\r\nKosher salt and freshly ground black pepper\r\n\r\nDirections\r\n1. Place avocados, onion, bell pepper, jalapeño (if using), garlic, cilantro, parsley, vinegar, and lime juice in the workbowl of a food processor fitted with a steel blade. Pulse until everything is finely chopped, stopping to scrape down sides of bowl as needed.\r\n\r\n2. With the motor running, drizzle in olive oil through feed tube. Process until sauce is completely smooth.\r\n\r\n3. Season sauce with salt and pepper to taste. Transfer to bowl and serve immediately.', '2023-03-15 21:38:48', 'guasacaca.jpg', 'Venezuelan cuisine\'s answer to guacamole has a brighter, tangier flavor.', 2),
(10, 'Chocolate Chip Cookies Recipe', 'Ingredients\r\n4 ounces unsalted American butter (about 1/2 cup; 113g), softened to about 65°F (18°C)\r\n4 ounces light brown sugar (about 1/2 cup, firmly packed; 113g)\r\n3 1/2 ounces white sugar, preferably well toasted (about 1/2 cup; 100g)\r\n1/2 ounce vanilla extract (about 1 tablespoon; 15g)\r\n2 teaspoons (8g) Diamond Crystal kosher salt; for table salt, use about half as much by volume or the same weight (plus more for sprinkling, if desired)\r\n1 3/4 teaspoons baking powder\r\n1 teaspoon baking soda\r\nPinch of grated nutmeg\r\n2 large eggs (about 3 1/2 ounces; 100g), straight from the fridge\r\n10 ounces all-purpose flour (about 2 1/4 cups, spooned; 283g), such as Gold Medal\r\n15 ounces assorted chocolate chips (about 2 1/2 cups; 425g), not chopped chocolate\r\n8 1/2 ounces raw walnut pieces or lightly toasted pecan pieces (shy 1 3/4 cups; 240g)\r\n\r\nDirections\r\n1. To Prepare the Dough: Combine butter, light brown sugar, white sugar, vanilla extract, salt, baking powder, baking soda, and nutmeg in the bowl of a stand mixer fitted with a paddle attachment.\r\n\r\n2. Mix on low to moisten, then increase speed to medium and beat until soft, fluffy, and pale, about 8 minutes; halfway through, pause to scrape bowl and beater with a flexible spatula. With mixer running, add eggs one at a time, letting each incorporate fully before adding the next. Reduce speed to low, then add the flour all at once. When flour is incorporated, add chocolate chips and nuts and keep mixing until dough is homogeneous.\r\n\r\n3. Divide dough into 8 equal portions (about 6 ounces/170g each) and round each into a smooth ball. Wrap in plastic and refrigerate at least 12 hours before baking; if well protected from air, the dough can be kept in the fridge up to 1 week (see Make-Ahead and Storage).\r\n\r\n4. To Bake: Adjust oven rack to middle position and preheat to 350°F (180°C). Line an aluminum half-sheet pan with parchment paper. When the oven comes to temperature, arrange up to 4 portions of cold dough on prepared pan, leaving ample space between them to account for spread. If you like, sprinkle with additional salt to taste.\r\n\r\n5. Bake until cookies are puffed and lightly brown, about 22 minutes, or to an internal temperature of between 175 and 185°F (79 and 85°C). The ideal temperature will vary from person to person; future rounds can be baked more or less to achieve desired consistency.\r\n\r\n6. Cool cookies directly on baking sheet until no warmer than 100°F (38°C) before serving. Enjoy warm, or within 12 hours; these cookies taste best when freshly baked (see Make-Ahead and Storage).', '2023-03-15 19:36:58', '1678902272cookies.jpg', 'Rich, buttery, and giant chocolate chip cookies, loaded with crunchy walnuts or pecans.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `idRating` int(255) NOT NULL,
  `idPost` int(255) NOT NULL,
  `idUser` int(255) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `idRole` int(255) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`idRole`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `idSurvey` int(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`idSurvey`, `question`, `active`) VALUES
(1, 'What recipes do you want me to post in the future?', 1),
(2, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` int(255) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `activationCode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idRole` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `name`, `email`, `pass`, `active`, `activationCode`, `date`, `idRole`) VALUES
(1, 'Stefan Salvatore', 'stefansalvatore@gmail.com', '20d8751bb9469d0474a2cff686e0e572', 1, 'e1883392014aa6ad1c4d4b89919477b1', '2023-03-14 18:28:58', 1),
(2, 'Caroline Forbes', 'carolineforbes@gmail.com', 'f0588f6c2efbab6204a0196cfaeb0674', 1, '8e3a14d00e64fc485b5f48c48be9cfb8', '2023-03-14 16:46:02', 2),
(3, 'Bonnie Bennett', 'bonniebennett@gmail.com', 'c6cc03089c47644d1bf16b0a028564d0', 1, 'e5ae5caaf6d20acbd86dca234d1e7c36', '2023-03-14 16:48:10', 2),
(4, 'Klaus Mikaelson', 'klausmikaelson@gmail.com', '106ae498c8b3e65567b570ce1dc9ee9f', 1, 'fabd6f1793a7bcffb03787699d150232', '2023-03-14 16:52:00', 2),
(5, 'Damon Salvatore', 'damonsalvatore@gmail.com', '9d43dd672c8daa5c3eca2e013a12cfab', 1, 'bbcdd0bdc2e3fc2d4f67b7756f30fb7e', '2023-03-16 00:10:50', 2),
(6, 'Katherine Pierce', 'katherinepierce@gmail.com', '78a87f9f33912de840a0bf78dce7d97d', 1, '2b9a8917ee40c06113219ac3f15a0552', '2023-03-16 00:10:59', 2),
(7, 'Matt Donovan', 'mattdonovan@gmail.com', 'f92c54ad66cda1f99c728444c8cb2241', 1, '19f6f38354831df5a40f9cb8257ffac9', '2023-03-16 00:11:07', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`idAnswer`),
  ADD KEY `idSurvey` (`idSurvey`);

--
-- Indexes for table `answerssurvey`
--
ALTER TABLE `answerssurvey`
  ADD PRIMARY KEY (`idAnswerSurvey`),
  ADD KEY `idAnswer` (`idAnswer`),
  ADD KEY `idSurvey` (`idSurvey`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCategory`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idPost` (`idPost`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`idMessage`);

--
-- Indexes for table `nav`
--
ALTER TABLE `nav`
  ADD PRIMARY KEY (`idNav`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`idPost`),
  ADD KEY `idCategory` (`idCategory`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`idRating`),
  ADD KEY `idPost` (`idPost`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`idSurvey`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `idRole` (`idRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `idAnswer` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `answerssurvey`
--
ALTER TABLE `answerssurvey`
  MODIFY `idAnswerSurvey` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `idCategory` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `idComment` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `idMessage` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nav`
--
ALTER TABLE `nav`
  MODIFY `idNav` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `idPost` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `idRating` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `idRole` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `idSurvey` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`idSurvey`) REFERENCES `survey` (`idSurvey`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answerssurvey`
--
ALTER TABLE `answerssurvey`
  ADD CONSTRAINT `answerssurvey_ibfk_1` FOREIGN KEY (`idAnswer`) REFERENCES `answers` (`idAnswer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answerssurvey_ibfk_2` FOREIGN KEY (`idSurvey`) REFERENCES `survey` (`idSurvey`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answerssurvey_ibfk_3` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `posts` (`idPost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `posts` (`idPost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
