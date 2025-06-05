<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/shinys">
        <html>
            <head>
                <title>Líneas Evolutivas Pokémon</title>
                <link rel="stylesheet" type="text/css" href="../web/css/shiny.css"/>
            </head>
            <body>
                <h1 class="titulo">SHINYS</h1>
                <xsl:for-each select="shiny">
                    <xsl:variable name="bgColor">
                        <xsl:choose>
                            <xsl:when test="pokemon/tipo='Planta'">#e6f7e6</xsl:when>
                            <xsl:when test="pokemon/tipo='Fuego'">#ffe6e6</xsl:when>
                            <xsl:when test="pokemon/tipo='Tierra'">#e6f7e6</xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <div class="linea-evolutiva" style="background-color:{$bgColor}">
                        <xsl:for-each select="pokemon">
                            <div class="pokemon" style="background-color: {$bgColor}">
                                <img src="{imagen_shiny}" alt="{nombre}"/>
                                <h2><xsl:value-of select="nombre"/></h2>
                            </div>
                            <xsl:if test="position() != last()">
                                <div class="nivel">
                                    <img src="../images/60554.png" height="50px" alt="flecha"/>
                                    <p>Nivel <xsl:value-of select="nivelEvolucion"/></p>
                                </div>
                            </xsl:if>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>