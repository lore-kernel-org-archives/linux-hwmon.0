Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857431946DA
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 21:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659244; cv=none; b=q9LyCJqcfqbypXdUwPFEE7b2uJQovw8g4nnyCNgqXk4feU7cDrO1o8wyUzZd34vFNlyEPjyDfORjFRA5swUpAauIN6UckmkaRG5ByiO+dB0kXqWpoQw9tX7d5/2mY/60rqQ1/RjUeKxl+nP7+XzzKNdZRR4nPsls8/XnBHWFP8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659244; c=relaxed/simple;
	bh=6R8PrkFcQOCkIy4N2WzayI9dh6LczXsY2dRZzlQ20Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FDthm/ghoNgPQijvd9mcWlshglgOqbCT2rCNrMJmAsh9Z4f11IYJFc/zXieZqGvDGuDTZ7KN87tvnK3cJExquCmmD3MEp4FYSVl9EHo6bKtYPgaagJeYg3ltWru78N9cVDqsQAMQ+Nki/AGWkbrSakHtqG0uqChkRiepp9+IbXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sobrie.be; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhTgeb/D; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sobrie.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhTgeb/D"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b904e1cd038so982719366b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 13:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772659241; x=1773264041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=A6fnLdIBwuzKkIFXrEW2ZKLeYt2tdG7l6PDBWXCSAU8=;
        b=YhTgeb/DZlu6PqJLI7pFECxTMaczmWreCEUxtUqjBRh7JBxrDYSsfAnO24FptkUQKG
         eOI134xYI+YVXiy/0SkkTb8/UJF5iiW5XAVHno90phWN+f8AJf5kMVzqzYS49EIsiJHB
         vbZ2a7qoVATfME9j4jVhXbw0BtLgJovYM7eMxFEzrWzohHrxsqZwfGRUEcV43Y2MWUAK
         jEIxPP7qLgJbLsFSVZrNHifyr2UhEE1ttPdNKNYdydc6G+aZJfSGECBsIlC/VCdZv1i0
         2mmSw/ELoMw8OjrL5BXdjRQnE8r8I0rzzzOuMUE4bGpK3h2kwXAvdkWi8hZ1n858DQXP
         ViWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772659241; x=1773264041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6fnLdIBwuzKkIFXrEW2ZKLeYt2tdG7l6PDBWXCSAU8=;
        b=s99IZn44H6GD4+AymrquGxvGPkY6tQeGS20Drx+nPJmQIwI3AWzjFi2WJdlbbgjS63
         mjYrqbODCDpAkR+weubx+sIMLl42u5MdlF4BIvgPdLVuoDHfWl/niCOeswQi6CZoR048
         4025OSRadm0S9oQoZVkVFNBP+9IxyxLJonLh7t0TKaLwvIM0LWCzeMcXvQknDUB4bCrd
         RUYAN64IJmkGPn3Ns9vXBI5ovzxalbuETVEKvnANtSGEL203P+palBATCjad4YC/j4lk
         QJKf9ZSeta6yZclnQ5Jqn7QSnge+zQcwZP59OEcAdEXZ8lui0kmX7ilriwjOEneMDRKi
         1Geg==
X-Gm-Message-State: AOJu0Ywu/RZjJEuZKMNkoIKWUslDR3qN/iyscHsavTan1cpD68kDSKKk
	R9pwdDNJbksPsLUkZiKujGIOJroTlbfTBexNf05diNTO1C+QSFpvddU+Ji/3Lh89
X-Gm-Gg: ATEYQzzOXw+r9l8xDBQEgwVQO1y301joURQI5BOe5KMCJjPDZMPgvQG8Lrv6N1aLlLi
	Q621n4fruHed7/dmtJatWdvZ1TS4oRfyLR1zKCglDPjgfjLaUBs7jkW6TMWYJXeyHiHHChV8T92
	gK/RKf3NvC0OplDKM63riFrrIlo8B5I6Cmda0eufGl0NcFnAzONmw4ClGeN1bTqzCp6ZYWMh+xu
	B/4NYV5LGUCT4cdsrBzrix7oDStLg6wgOKiaEFPAhp8nvuCDNXaeR8nmfTeY2vHAs4Y28antzCs
	apojkuKeY2IM7Dc0PW9QmM3bUQgCmh0GOyzseJHxgAurTuRw8drRtg8tbGaMEVKqdDU49/6wzsU
	130QM13jOyEJXL7F+rxzWZ3NZBPjuXy8sPcGbcQQjIsyKSQ5nYbNJPuej5Hsp73z5/WY8iuzz03
	1ZZn2MTLlCgLImn73Stul4p7DQukGOP/f0sBUnhIl6g9xN3AXfgFw=
X-Received: by 2002:a17:907:70e:b0:b73:2b08:ac70 with SMTP id a640c23a62f3a-b93f1430131mr202869766b.49.1772659240655;
        Wed, 04 Mar 2026 13:20:40 -0800 (PST)
Received: from localhost ([2a02:a03f:b7dc:2b00:a97a:8551:7733:cb60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93c8e3d060sm331313266b.56.2026.03.04.13.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:20:40 -0800 (PST)
Sender: Olivier Sobrie <olivier.sobrie@gmail.com>
From: Olivier Sobrie <olivier@sobrie.be>
To: Guenter Roeck <linux@roeck-us.net>,
	Naresh Solanki <naresh.solanki@9elements.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (max6639) fix inverted polarity
Date: Wed,  4 Mar 2026 22:20:39 +0100
Message-ID: <20260304212039.570274-1-olivier@sobrie.be>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MAX6639 documentation:

  D1: PWM Output Polarity. PWM output is low at
  100% duty cycle when this bit is set to zero. PWM
  output is high at 100% duty cycle when this bit is set
  to 1.

Up to commit 0f33272b60ed ("hwmon: (max6639) : Update hwmon init using
info structure"), the polarity was set to high (0x2) when no platform
data was set. After the patch, the polarity register wasn't set anymore
if no platform data was specified. Nowadays, since commit 7506ebcd662b
("hwmon: (max6639) : Configure based on DT property"), it is always set
to low which doesn't match with the comment above and change the
behavior compared to versions prior 0f33272b60ed.

Fixes: 0f33272b60ed ("hwmon: (max6639) : Update hwmon init using info structure")
Signed-off-by: Olivier Sobrie <olivier@sobrie.be>
---
 drivers/hwmon/max6639.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index a0a1dbbda887..9a3c515efe2e 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -607,7 +607,7 @@ static int max6639_init_client(struct i2c_client *client,
 			return err;
 
 		/* Fans PWM polarity high by default */
-		err = regmap_write(data->regmap, MAX6639_REG_FAN_CONFIG2a(i), 0x00);
+		err = regmap_write(data->regmap, MAX6639_REG_FAN_CONFIG2a(i), 0x02);
 		if (err)
 			return err;
 
-- 
2.53.0

