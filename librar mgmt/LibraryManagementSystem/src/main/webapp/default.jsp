<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default</title>
</head>
<body>
 <div class="scrollbody">
    <div class="section-container">
        <h2 class="section-title">New Arrivals</h2>
        <button class="scroll-btn left-btn" onclick="scrollCarousel(-1, 'new-arrivals-carousel')">&#10094;</button>
        <div class="scarousel" id="new-arrivals-carousel">
            <div class="book-item">
                <img src="https://i.pinimg.com/736x/cc/7c/23/cc7c23a4a3ff5ee6421aa2d427e930a1.jpg" alt="Book 1">
                <p class="book-title">Naruto</p>
            </div>
            <div class="book-item">
                <img src="https://i.pinimg.com/474x/5a/94/82/5a9482c60ce5a410638b00e27eb811ef.jpg" alt="Book 2">
                <p class="book-title">Demon Slayer</p>
            </div>
            <div class="book-item">
                <img src="https://i.pinimg.com/236x/f6/ee/d9/f6eed9bd5277e7d5603eba7b8cefee71.jpg" alt="Book 3">
                <p class="book-title">Boruto</p>
            </div>
            <div class="book-item">
                <img src="https://i.pinimg.com/236x/55/b7/b6/55b7b67b9cf06a61ab5616c45c1d47f0.jpg" alt="Book 4">
                <p class="book-title">Death Note</p>
            </div>
            <div class="book-item">
                <img src="https://i.pinimg.com/236x/40/f0/59/40f059be8a216b305102f41cf0484b6f.jpg" alt="Book 5">
                <p class="book-title">One Piece</p>
            </div>
             <div class="book-item">
                <img src="https://i.pinimg.com/236x/e6/7d/9f/e67d9fc70d57b4d662ae455f171fd55e.jpg" alt="Book 5">
                <p class="book-title">Attack On Titans</p>
            </div>
             <div class="book-item">
                <img src="https://i.pinimg.com/474x/bf/c0/a6/bfc0a68a0f9193baa0820ca9792f1651.jpg" alt="Book 4">
                <p class="book-title">Bleach</p>
            </div>
            <div class="book-item">
                <img src="https://i.pinimg.com/236x/d1/ec/56/d1ec56eaea2b1f7fb17834880083b383.jpg" alt="Book 5">
                <p class="book-title">Dragon Ball</p>
            </div>
             
        </div>
        <button class="scroll-btn right-btn" onclick="scrollCarousel(1, 'new-arrivals-carousel')">&#10095;</button>
    </div>

    <div class="section-container">
        <h2 class="section-title">Most Popular Books</h2>
        <button class="scroll-btn left-btn" onclick="scrollCarousel(-1, 'most-read-carousel')">&#10094;</button>
        <div class="scarousel" id="most-read-carousel">
            <div class="book-item">
                <img src="https://orion-uploads.openroadmedia.com/sm_f7e651-tolkien-lordoftherings.jpg" alt="Book 1">
                <p class="book-title">Lord Of The Rings</p>
            </div>
            <div class="book-item">
                <img src="https://i.pinimg.com/236x/29/56/d8/2956d84b419084db2ecb20463c1bbb52.jpg" alt="Book 5">
                <p class="book-title">Marvels</p>
            </div>
           
            <div class="book-item">
                <img src="https://i.pinimg.com/236x/aa/ba/5b/aaba5b1d1158d5791482816711a95b55.jpg" alt="Book 3">
                <p class="book-title">Game Of Thrones</p>
            </div>
            <div class="book-item">
                <img src="https://static.toiimg.com/photo/msid-85457699/85457699.jpg?57874" alt="Book 4">
                <p class="book-title">Money Heist</p>
            </div>
            <div class="book-item">
                <img src="https://i.pinimg.com/236x/c5/0b/46/c50b465b3b1c6e7cb6162e6f4801b56b.jpg" alt="Book 5">
                <p class="book-title">Justice League</p>
            </div>
           
            <div class="book-item">
                <img src="https://i.pinimg.com/474x/46/2b/cf/462bcf13cbfdf73167e5e31b44787fae.jpg" alt="Book 3">
                <p class="book-title">Stranger Things</p>
            </div>
            <div class="book-item">
                <img src="https://i.pinimg.com/474x/89/d0/e1/89d0e1123639ac2cca1103395310527c.jpg" alt="Book 4">
                <p class="book-title">Mirzapur</p>
            </div>
             <div class="book-item">
                <img src="https://orion-uploads.openroadmedia.com/sm_9333ba5b72d2-hp.jpg" alt="Book 2">
                <p class="book-title">Harry Potter</p>
            </div>
        </div>
        <button class="scroll-btn right-btn" onclick="scrollCarousel(1, 'most-read-carousel')">&#10095;</button>
    </div>

    <script>
        function scrollCarousel(direction, carouselId) {
            const carousel = document.getElementById(carouselId);
            const scrollAmount = 220; // Width of each book item + margin
            carousel.scrollBy({
                left: direction * scrollAmount,
                behavior: 'smooth'
            });
        }
    </script>
</div>
</body>
</html>