Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753477;
	b=2eVP2Tf66XrP9LSDBavKqRjDtq4YAVG6LYGCbu1pm+htweCE/I+s+LncxxE5gvtz5/0P
	 +EB+KbBI0Ahg8uwIJERxaemjqn7uo2B/TxMw2uDIKHnfvc8XOba2oyFIK1WOxQWZ1mhD5
	 C15J104Lz8SVrBTBBM/I8xscTo+JAsmQm4a75OiEupSbUUK4nVomFRaRaeiFTbToMzmmg
	 S2aCdtYyGQGyNs3+X94093iz3W+v6XToBHyQSS+LkGpiqkkD3R1pqxrI57I/+m8k7TFPV
	 HCBFbt2bL7ueOpf8xsL3ksRzsgk2fVnCAbFqzC2u6kmNrzGdN4nsCjRuG8nB+1dOBlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
	b=RN+z3liJgvQdB5m8bfXMLNMG0949ZKeB9/W46ppR/8Wvjm+tU3qpblHg7vIXvVDy3woh
	 6fvGhoJQPSyR6NRDGwN6MnqmAKG2e5FYHTsgBAsKYBcgbJEhPGa4MQhLmq7vQXFqmScaN
	 2VLX9NLBxMjV1Htnj7rOBagFo6e+nrtBmKQYkQ/4plbbbM1r3oMVxXFZez14N39ubblHB
	 ryW5oZL+IrIZXgIIokGpVclcp98sKWCMgOQf19hidlz3/Rr0Jn0/UtlES9j7OsY2G2wVW
	 rJc51NCptUhJFwEDefpyI55m4Z0uFaBs8VQoL1VnQYkJObqc+bmkNrbOVGzGroGDamg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgMM1oCm;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44127606A331
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 14:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44127606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgMM1oCm
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28187375e9.3
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 06:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753475; x=1795358275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
        b=wgMM1oCm19H9nkfpQbqXJxER76d+59wyUvMYQQhTVXQpWtQ5/IJums4X9JieCNAkoa
         uS4TvuU6cFBvxMyzTZMkJYuYCml8vOkWVNUNobgQlAhpln0BktuIvlqeM8yjdyEneZAN
         FxmMgwOB28PW+97NS0GJbnJJ2gqsQF+QBmow96yCpnSgNylEfzANlhJusG2LWYZXpjkT
         XC22o4ftVL0r26urVxpoQ3FuDKXFnxY8JmCue7hV9D4bDKR2Mo2iRts2nrQky5a/kt4O
         8VXHZfE2tDqN06BXri9YI62j2zNMQheowcBlAVZF/822McJEXAjbHbQ1ebGPAul3q4So
         1mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753475; x=1795358275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvIS5md/ELelQNeUHVBEavNxoknEQCRB1v/ojNbvo5Y=;
        b=V+li4ne+nG3S4C3Ub3Mc23lxgS3/jkvhUbsbm3Hlfu7XZZqFJ3QKqYIT11F//TDfK2
         lwuhcXgOzAAUHlXHqisnErkTrld0kXE+OXt+Mja1tmF4lLNmef8RC9Hozj0VksD90QhB
         BSmI7pf2BadUbG3M+wsR4sX01M1EDVVH4Dh4n/bpw51qK4wB388CnNImT2aurt3+pZft
         B0tGiDcVcsAzpzZd+QyHmveeVNryOkbjL7NLgJEQhmAIPpgkYZtAhOV/LG/IIHo0UjZd
         +owqv6h+6pl6YeUpW6PSXAmWQdG6pYYFrKbdxPLUdzsnRfNYJY4bbPq5twN553me7J9O
         KZfw==
X-Forwarded-Encrypted: i=1; AL+hErFM77PDE0rPMaNK5+0+xP0UVdkYn7Gq/eMLMDIFCJlJ/1S2QFJkSPPWnSMf9nTgmfY7e+M/9lr6ddPD8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9T/9zPPaktfBOWBwZBZBTIeJe221iLFDaiDFH2oELSQgG+oADj
	TJ1OhGEj6eaN4GmQ7iX5GqnrzUhdt3NiUowCKuy4x/9Qin9rst5Ghiue
X-Gm-Gg: AYBFou2WA8g3wTVoZhOAB7h/SHR6gSkr/yKLwNmcXK8KzIy4nLXof2SQzwTYivBEOP7
	FNfQ/LQKTkjVFSjSsfq/J8HocY11X/p4u3NjMSZ+Yo7Nusm5B+LtDGX/bJNrDudixyzhpUnMOU1
	l2Qgk/Ca5kSDcVXjgQC885J9MrUPqMy4lSqwV+W9tNymtfQBBXSfil8VtJgrUhuTwfjSqgsIRek
	xwKFTmfR6YjIbgYlqhxCO3bnag8yLSqcdzDJNTjxmQlOHwVuch8UHrYBQEJMI6vFzoYCKdGoskp
	qrHu0bQMNITPq9ratRbllvyiQrcP2XrlDjtyo7xBID/cBEWDI+WONeOhyjBxYtg3GHkvEFeOQvj
	wSRh552jnohPx/Lgun79M9jGsNinCe5Rlcb7Z6GVhmNUZc5k8pRGGpLjXIUyfLNPIOPnA/2qkt3
	p1CrReI/v8sWuJsrtwCperHIIkZ/L7HhJRL+fhxe1dyRB9plSYBuZaAsN4kcZi6L0X0Dc26pph+
	Q8Z2szT14S/ui59rUFZBfLJ3uHt+ErflAAKj+dCxzrHx03CoipJx6OuPC2FGDlTnhQFyp1/+AOH
	1OyNXaFBmu5sn43ov2Dzgm9sSPNmg1P56YYlmuONrCEVAyC0fZ+WAtqfkqQAVb7hZlLa2U9MvPE
	h9LVhxdECAZaiIhk=
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb69b2d82fmr44982955e9.25.1794753475500;
        Sun, 15 Nov 2026 06:37:55 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:54 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E DARK HERO
Date: Sun, 15 Nov 2026 15:25:39 +0100
Message-ID: <20261115143708.492883-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115143708.492883-1-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ROG CROSSHAIR X870E DARK HERO board, which provides the same sensors
as the non-DARK version.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index b22bd5c8f491..b3a061bd10db 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -28,6 +28,7 @@ Supported boards:
  * ROG CROSSHAIR X670E EXTREME
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
+ * ROG CROSSHAIR X870E DARK HERO
  * ROG CROSSHAIR X870E HERO
  * ROG MAXIMUS X HERO
  * ROG MAXIMUS XI HERO
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 6c4565b0ce2f..d86f3614d557 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -991,6 +991,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_crosshair_x670e_gene),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E HERO",
 					&board_info_crosshair_x670e_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E DARK HERO",
+					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E HERO",
 					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO",
-- 
2.56.1

