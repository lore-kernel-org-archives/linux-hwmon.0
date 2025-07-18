Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418A515E5C2
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Jul 2025 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752847985; cv=none; b=vDNGuhwOyDZiJT4VU3FNdTAjbgI8+tW5Z3dxLwGymTEfOqN7iCBEa53OsDBqZNoW7snAn4X4M06PYOjxQqQJ3vbUw7xkKLzBfHHB1lXkKe+agc660NmZXkhDC3elCTMbXARJsRpPZBK3xwODBl1hlVA2KJ/QJFWNSToEDpN10hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752847985; c=relaxed/simple;
	bh=gRuoFQtmKUaRfbJUjBRpS3qKwR1FuGR+n2lAdbqy5Cg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUrq6wD5uuEZ25mU0DFZQDM785kBYi6XfPtoIqEa+PrAwOu8LObtmffUf9ghuFOFsjXO87fD7nHrk9d/IZglenkaVZ/1p8dM/pWKfmoK5dFgt+PITwGmL7ngOV+xTsjMFRT/1te9njL2S+jHVtNJk0F42TYdDnsHHMGU9s/n28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uclpT-00065i-MF; Fri, 18 Jul 2025 16:12:51 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Fri, 18 Jul 2025 16:12:49 +0200
Subject: [PATCH v2 2/3] dt-bindings: Add INA228 to ina2xx devicetree
 bindings
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-ina228-v2-2-227feb62f709@pengutronix.de>
References: <20250718-ina228-v2-0-227feb62f709@pengutronix.de>
In-Reply-To: <20250718-ina228-v2-0-227feb62f709@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-19c33
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=gRuoFQtmKUaRfbJUjBRpS3qKwR1FuGR+n2lAdbqy5Cg=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYsioCktqOjnH/tLRi74R9vpL7rx+2Wlisoi39urfDevq1
 jOplLQwd5SyMIhxMMiKKbLEqskpCBn7XzertIuFmcPKBDKEgYtTACbSWMzw30OoMd+1oUNYSY7D
 R1P/0c4lf2bcm/VUoywq/4mW7bG56gz/VCNSjjtPtYlqn6IWyp7UbcIwy/D+jX3TxNNfHfnMdt+
 HGwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Add the ina228 to ina2xx bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index d1fb7b9abda0..fa68b99ef2e2 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -25,6 +25,7 @@ properties:
       - ti,ina219
       - ti,ina220
       - ti,ina226
+      - ti,ina228
       - ti,ina230
       - ti,ina231
       - ti,ina233
@@ -107,6 +108,7 @@ allOf:
               - ti,ina219
               - ti,ina220
               - ti,ina226
+              - ti,ina228
               - ti,ina230
               - ti,ina231
               - ti,ina237

-- 
2.50.1.319.g90c0775e97

