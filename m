Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1804FC330
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896281; cv=none; b=VwnSiIjIFAVmewrnaS1G1hIco4rW37Tv2eiVaTNO1OvesTjhDaMc4f3f/AqU1TC002uwlHohPv4VXB/TtPhjk2n5PLVEMkzUulZewX+/tPU3i0dOqmRaRfLC1TF/qLRC/EW/oN+haODkO9z1jNZwjJgbPZEfdHvHzD8XKJrolJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896281; c=relaxed/simple;
	bh=+oi137C5v8lhZ9D/rjwYIKeb/nW7GuQAEUI5HDYvogI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnfKJbvg39O52a+vjTwwYbg5j4bHs92QDEQ0T6ze0PZtg7mIljA3eJ+KZSLJT3GsEe+3qmypUvfPlRwm0wqQoEB9ih181TaW73uwGmgkbLXgGVG//M/E7VMkKpv/18/LT5oj3JczNblUQmqypORZI5HJViSi6MzwQ0QBjpeX5HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=sYWalRoB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="sYWalRoB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e8c710847so359858166b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896278; x=1792501078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=;
        b=sYWalRoBeFGMvTE3WHoK+RNVkaAHq2TEOz+F4n0Frm7Up/Z0EwSvvjO6gx3GqDn9FS
         fuy7MmDxrwi9OXXtSDCZMLRLc7/1ca0HVfWPyf78FBJ97l5pxilTiA4IX2+4C1AO67CT
         qyS0wdxYmZoSEzufJb+KAP247vDnmkFhime/dlqiS18OtW5vJB4qHYSEvGSIcv2LK8Y4
         qh7YyZ3i2ct3ys0OeWyNINnSQrv6TcmgfnbzoiaBBoshC6P1Ydoj426LZCyiR2Uv0W9z
         43eklAvPBpTo7UgEMAQpBAXegl86GV48B/01L/t+u/0ikFUfqikvNC/js9a4Vns/+hvx
         nxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896278; x=1792501078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=;
        b=eCYRv6vpfX7TID7aUhprFA/QY5vgSdRA2C45+Ci3cUQitsu7jjuVNP7kZjMdFXlVIL
         GaUNsu4ZUCWIxPD9JpbW5Z6VvS/tLTh3jN6DnnRFHo1iB7+vrWC5xZL8QGUj9udUbXqR
         e66ENPqB0ThO2ZiPiGn7iS5JqLyccaic8cLbTw8PZs2bhIvC3cVDvudw72Ncf1HQn7wg
         vMEKFs/t2kA7nLZv055Dkm83acOJIpeWUl1ZUKxCCN9EuN6u38gCegYsRAGj+Rw9DPSr
         pUn+B1JkvSrHqgDQto2GodQlsI0QTaXK7zNKWqWAB2C5nO7e2dVwtp/5nBlnVJgM0f7Q
         Xlgg==
X-Forwarded-Encrypted: i=1; AKwUvBxqhKWkOgwbVjMEqc9ZUAoV9Opvuvxti2ySfy2R/QiJaek/kVL1XXEwO4ZOVfImkaeTbCNSS8E6tKh36g==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+O4XOd/Br0fDzenZiX9kda5D3mG8bd/R3n54LsBXthYihmQ2f
	AJaLAdPuNkJygOkknnb8zsOTYD1wdMg8TAw3FWszfg81sauo955JsDObI0TNAflOMeI=
X-Gm-Gg: AYBFou0QDJ9zLOCcRJZdUQ/x1cS5+l6cp0g69kbAGZzD8J2YvbEUH1rvf8gcF02s2G7
	V7a4sKLC14Vx6+63uu5/AmxJMV9PT/NZhgZr8H1EkRnJTd9jy2f9DuFs9KuNWyt/IjRnq4cyLmL
	MuFlEELN918wB5SweSpKgKwHdy8nLwz/CCu/PbPY0ARKNWKP7DRBUOmpqy3LAxfnDOCLWAsRtxT
	ugKim6LYF+lPN5PK5nclJLXBVsMlNupAwmEjjM1YoTEvgvSSA20drA49KW6vcegFM5tz5F7Em/D
	9gen8Vwqc40lOYyAXs9n+PtjFfevVvofesrHbRvRp9Yfei3JCl5C2Om2BgTNRAfiafYRWQVeBTy
	KLxOz7bTJi0UwiNkHL4FOVoU0sgb4kvddgJbLDmf5pQApRBNns2hSEjKYo+oIfcSJPZqwbwB42F
	OKdUVBONg/+XJOksJhGXg4hXGYZAquSjJ2Y6xbJeeWdNlDIdoNLCfAgZ2Pzsq4KjHNahSK16Vb3
	IXVMSFOagnQlFcRlTthyb80YVp/7izKwuh143x3w4EwCI6IYbG6h0hu06JJa30IhuLm3xV6ORjC
	C0PxvONQYR4F8Va9P5Ly0bHbMfbJ/yo=
X-Received: by 2002:a17:907:8692:b0:c2e:2720:8f68 with SMTP id a640c23a62f3a-c31aa01b41fmr1097966566b.46.1791896278346;
        Tue, 13 Oct 2026 05:57:58 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:57 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 6/6] arm64: dts: microchip: lan969x: add fan controller
Date: Tue, 13 Oct 2026 14:56:30 +0200
Message-ID: <20261013125735.1542349-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x provides a PWM fan output and tachometer input in the DEVCPU_GCB
target. Add the fan controller register region to the hardware-monitor
node and use the combined LAN969x hwmon compatible. Declare two PWM cells
for the period and standard polarity flags.

Board-specific fan configuration and pin routing remain in the individual
board device trees.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..cf98b35912245 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -523,9 +523,11 @@ sgpio_out: gpio@1 {
 		};
 
 		tmon: hwmon@e2020100 {
-			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
-			reg = <0xe2020100 0xc>;
+			compatible = "microchip,lan9691-hwmon", "microchip,sparx5-temp";
+			reg = <0xe2020100 0xc>, <0xe2010348 0xc>;
+			reg-names = "temp", "fan";
 			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
 			#thermal-sensor-cells = <0>;
 		};
 
-- 
2.56.0

