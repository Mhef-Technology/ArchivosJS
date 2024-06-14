<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/memorama.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Memorama</title>
    </head>
    <%
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usu") != null) {
            String usuario = sesion.getAttribute("usu").toString();
            String tema = sesion.getAttribute("tema").toString();
    %>
    <body class="<%=tema%>">
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="juegos.jsp" title="Ir al menú de juegos"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <main>
            <section class="box">
                <div class="profile">

                </div>
            </section>
            <section class="memorama-section">
                <div class="memorama" id="memorama"></div>
                <div class="win-message" id="winMessage">¡Ganaste!</div>
                <button class="restart-button" id="restartButton">Reiniciar</button>
            </section>
        </main>
        <footer>
            <div class="subir">
                <a href="#box">Ir al principio</a>
            </div>
            <nav>
                <div class="containfooter">
                    <div class="bordeizq"></div>
                    <div class="leftfooter">
                        <div class="aboutus">Conócenos</div>
                        <ul>
                            <li><a href="http://mhef.gerdoc.com/#mision">Misión</a></li>
                            <li><a href="http://mhef.gerdoc.com/#vision">Visión</a></li>
                            <li><a href="http://mhef.gerdoc.com/#objetivos">Objetivos</a></li>
                            <li><a href="http://mhef.gerdoc.com/#politicas">Políticas</a></li>
                            <li><a href="http://mhef.gerdoc.com/#filosofia">Filosofía</a></li>
                            <li><a href="http://mhef.gerdoc.com/#valores">Valores</a></li>
                        </ul>
                    </div>
                    <div class="centerfooter">
                        <div class="help">Ayuda</div>
                    </div>
                    <div class="rightfooter">
                        <div class="contact">Contacto</div>
                        <ul>
                            <li><p class="tit2">Teléfono:</p></li>
                            <li><p class="numero"><i class="fa-solid fa-phone" style="color: #ffffff;"></i>5503923923</p></li>
                            <li><p class="tit2">Correo electrónico:</p></li>
                            <li><p><i class="fa-solid fa-envelope" style="color: #ffffff;"></i>mhef.technology@gmail.com</p></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="socialNetworks">
                <ul>
                    <li>
                        <a href="https://www.facebook.com/profile.php?id=61550922583788&mibextid=ZbWKwL"><i class="fa-brands fa-square-facebook"></i></a>
                        <a href="https://www.instagram.com/mhef_technology/"><i class="fa-brands fa-square-instagram"></i></a>
                        <a href="https://github.com/Mhef-Technology"><i class="fa-brands fa-square-github"></i></a>
                    </li>
                </ul>
            </div>
            <p class="fin">&copy; 2023 Mhef Technology. Todos los derechos reservados</p>
        </footer>
        <script>
            const images = [
                'img/monal.jpeg', 'img/literatura.jpeg', 'img/olim.jpeg', 'img/mar.jpeg', 'img/brasil.jpeg', 'img/basilica.jpeg',
                'img/desierto.jpeg', 'img/rio.jpeg', 'img/titanic.jpeg', 'img/pi.jpeg', 'img/ejipto.jpeg', 'img/piramide.jpeg', 'img/mundo.jpeg', 'img/marte.jpeg', 'img/canguro.jpeg', 'img/adn.jpeg'
            ];

            function shuffle(array) {
                for (let i = array.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [array[i], array[j]] = [array[j], array[i]];
                }
            }

            function getRandomImages(images, count) {
                shuffle(images);
                return images.slice(0, count);
            }

            function createCards(images) {
                const selectedImages = getRandomImages(images, 6);
                const doubleImages = [...selectedImages, ...selectedImages];
                shuffle(doubleImages);

                const memorama = document.getElementById('memorama');
                memorama.innerHTML = ''; // Limpiar memorama antes de crear nuevas cartas
                doubleImages.forEach(image => {
                    const card = document.createElement('div');
                    card.classList.add('card');
                    card.dataset.image = image;

                    const cardInner = document.createElement('div');
                    cardInner.classList.add('card-inner');

                    const cardFront = document.createElement('div');
                    cardFront.classList.add('card-front');
                    cardFront.textContent = '?';

                    const cardBack = document.createElement('div');
                    cardBack.classList.add('card-back');
                    const imgElement = document.createElement('img');
                    imgElement.src = image;
                    cardBack.appendChild(imgElement);

                    cardInner.appendChild(cardFront);
                    cardInner.appendChild(cardBack);
                    card.appendChild(cardInner);
                    memorama.appendChild(card);
                });
            }

            createCards(images);

            let cards = document.querySelectorAll('.card');
            let hasFlippedCard = false;
            let firstCard, secondCard;
            let lockBoard = false;
            let matchedPairs = 0;
            const totalPairs = 6;
            const winMessage = document.getElementById('winMessage');

            function flipCard() {
                if (lockBoard)
                    return;
                if (this === firstCard)
                    return;

                this.classList.add('flipped');

                if (!hasFlippedCard) {
                    hasFlippedCard = true;
                    firstCard = this;
                    return;
                }

                secondCard = this;
                lockBoard = true;

                checkForMatch();
            }

            function checkForMatch() {
                let isMatch = firstCard.dataset.image === secondCard.dataset.image;

                isMatch ? disableCards() : unflipCards();
            }

            function disableCards() {
                firstCard.removeEventListener('click', flipCard);
                secondCard.removeEventListener('click', flipCard);
                matchedPairs++;

                if (matchedPairs === totalPairs) {
                    winMessage.classList.add('show');
                }

                resetBoard();
            }

            function unflipCards() {
                setTimeout(() => {
                    firstCard.classList.remove('flipped');
                    secondCard.classList.remove('flipped');
                    resetBoard();
                }, 1500);
            }

            function resetBoard() {
                [hasFlippedCard, lockBoard] = [false, false];
                [firstCard, secondCard] = [null, null];
            }

            function resetGame() {
                matchedPairs = 0;
                winMessage.classList.remove('show');
                createCards(images);
                cards = document.querySelectorAll('.card');
                cards.forEach(card => card.addEventListener('click', flipCard));
            }

            document.getElementById('restartButton').addEventListener('click', resetGame);
            cards.forEach(card => card.addEventListener('click', flipCard));
        </script>
    </body>
    <%
    } else {
    %>
    <html class="fail">
        <body class="failbody">
            <main>
                <section class="boxx">
                    <div class="inputbox">
                        <h1>Solicitud ilegal</h1>
                    </div>
                    <button name="boton-continuar" id="boton-continuar" onclick="window.location.href = 'login.jsp';"><-- Regresar</button>
                </section>
            </main>
        </body>
    </html>
    <%
        }
    %>
</html>
