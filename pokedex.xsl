<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
    

    <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Pokedex</title>
                <link rel="stylesheet" href="./css/pokedex.css"/>
            </head>
            <body>
                <h1>POKEDEX</h1>
                <div class="menu-desplegable">
                    <button class="menu-btn">Filtrar</button>
                    <div class="menu-lista">
                        <a href="tipoFuego.html">Tipo fuego</a>
                        <a href="tipoPlanta.html">Tipo planta</a>
                        <a href="tipoTierra.html">Tipo tierra</a>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Imagen</th>
                            <th>Nombre</th>
                            <th>Información</th>
                            <th>Stats</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="pokedex/pokemon">
                            <tr>
                                <td>
                                    <img src="{imagen}" alt="Imagen de {nombre}"/>
                                </td>
                                <td>
                                    <xsl:value-of select="nombre"/>
                                </td>
                                <td>
                                    <div class="pokemon-details">
                                        <div class="pokemon-info">
                                            <xsl:value-of select="descripcion"/>
                                            <br/>
                                            Tipo: <xsl:for-each select="tipo">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="position() != last()">/</xsl:if>
                                            </xsl:for-each>
                                            <br/>
                                            Habilidad: <xsl:for-each select="habilidad">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="position() != last()">/</xsl:if>
                                            </xsl:for-each>
                                            <br/>
                                            Género: <xsl:value-of select="genero"/>
                                            <br/>
                                            Categoría: <xsl:value-of select="categoria"/>
                                            <br/>
                                            Evolución:
                                            <ul>
                                                <xsl:for-each select="evolucion">
                                                    <li>
                                                        <xsl:value-of select="@nombre"/>
                                                        <xsl:if test="@nivel"> (Nivel <xsl:value-of select="@nivel"/>)</xsl:if>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                            Debilidad: <xsl:for-each select="debilidad">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="position() != last()">/</xsl:if>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="pokemon-stats">
                                        <xsl:for-each select="puntos_base/*">
                                            <div class="stat-container">
                                                <div class="stat-label">
                                                    <xsl:choose>
                                                        <xsl:when test="name() = 'ps'">Puntos de vida:</xsl:when>
                                                        <xsl:when test="name() = 'ataque'">Ataque:</xsl:when>
                                                        <xsl:when test="name() = 'defensa'">Defensa:</xsl:when>
                                                        <xsl:when test="name() = 'ataque_especial'">Ataque especial:</xsl:when>
                                                        <xsl:when test="name() = 'defensa_especial'">Defensa especial:</xsl:when>
                                                        <xsl:when test="name() = 'velocidad'">Velocidad:</xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="name()"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </div>
                                                <div class="stat-value">
                                                    <xsl:value-of select="."/>
                                                </div>
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>