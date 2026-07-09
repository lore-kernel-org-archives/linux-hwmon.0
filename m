Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8A3D171B
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 20:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629663; cv=none; b=by56AP40y1f1N39/3DBK1Exg71V22koPVyI7jm7I7WP4N2Kqci8QAl91q1uJQVbU3MT5+W5JlfJNVsI5xjHwcgYSdXSTB8swB9ADSmVSFgse2VXt3sgjNf3yS3yuD4ARR0BG7doZtkI/4HTwekPOTvdqk4yvwOTTqjQlPh8zBLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629663; c=relaxed/simple;
	bh=yuVzDQjZFIrSnxq02dQAskpX+Rs8lHQXtgQukRC71Is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rwDEA5i2oH6Zxl5zHhtQYi0IgknCfD7INfVbdS6/CWoHPAi3csN9flcEFtFclC7f59FUHS0kCQ8xxLlzK7XzfIz35F4Lrio1gmL10ruvIV8IwhxRekfZKxQIUfSOtknfGHfwMuyKaCByMdEqSXqn5z/13QpVSS+HVtK87ZhAnsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbeRuSS8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbeRuSS8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso1330165e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 13:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783629660; x=1784234460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfcGcSXoucgiV/p34cl1ZsS5e38WLmn2Oo00fiU6CK4=;
        b=qbeRuSS8q4Tn3a3vf+tAMODZHIXr9gBLQbg4hOD23nKsEgru/+FlqI4CC+3C7wIcy/
         qWmfRSm8ThT83EepIRsA04+gckQYbEhD2v4MY7sGjW8k+vepmEM+2K08gHyg7HJ0v9Fx
         o1nJPuDfAw6V7TCN8/heTmKj0upQE+IwP1tXl7SfMHwMSd3pXBtVrQ2oYqej6y1ueOjM
         W5q0FnBM9zW+vjjavjMfYAy22nFyM9KZRIjN8shMR1yzzxtxcY2wUTGgU/KE6nvgBTjf
         cYDk71OkIai1yI+pnfMJCXJukG5ithbOwRjK1ol35tRJF0R6seY/19vetRCrPkFpVbBO
         6PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629660; x=1784234460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfcGcSXoucgiV/p34cl1ZsS5e38WLmn2Oo00fiU6CK4=;
        b=JaTjj2dgLeFQxZwjWl4+kbSpKP/FNE5q92cgp3eu+L2GK0/x/AVKISB56jR4q7zOSq
         qeSfaDfs2LsVPyyLlGngBriCZtFHdrY63vOwoMO3n+azPA4387LHIBhNuNVtvxgInvw1
         xRu2o8GJ3nWi6oBZFhchsI9MYtSGCGugQ2QKW9quj9axuVEj05Z7gEdNhDSWOeBz0hDi
         9VRV2FAs1o6/5dw/Vz5hwN25lPZyBvMQNDXFrlW3CnKH54lnynnd/KH7eadVIsGO7VfX
         5QdRKjDv8Ig/iarq5ufGmV/s01GsK6ZVW+LAM0yNfAdaruGnrtUbXlksVUfRFMGwm6iU
         GWDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1ogW7HvCIi4sUnatVtEfNJoZs7Y52AQWvfhztCEQVhtBgMKaKimrwQq6p/7u7TcZqO+qWjisVheupSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCCNht8fI6WLTXnmQlToF/IV5crDeJ3wZzYLkuZodjViUnMHLi
	n0JVsdjtdTs97GyeYp7tkKuB10FagfR2lPJ7oQ16p1LEpUVfhg2y3YQVRv2hug==
X-Gm-Gg: AfdE7cmKgudi8DxDB7+0glFWBOmv8c0mr0b3xHIP8/6/qeX6kgHQtRWuiUYJP/AQ74S
	AavfFVGzyZUOrkm473aTpBfUGoq1127UYb/8rYTdxummQRx3pLDd6KjyQOdozZ0FhBnPzjv+Rhd
	tpqf29TqXAr7K7ZgEYafJmlfH5EgDe5J7KyVh3BCIVN+UiRxEsb0s3VRKOgQyp/YXDcSFQFJKPN
	Db8Lk/fZlyzh6ph7v+8U+a0iN72WFgbHiRFNsl9D6Pzok3FkNTEZgVVhbNMKeLH7RUY7iFAwMs7
	WiW5TGhDXF9uS0fnrpY4nLDoI8s/fsPrp0Z94hdfkZ/rJbiNU6IHjVPWrNR0jtgs769n/Uc/BEz
	Y1TDHTfJmdCx7QO12BobEO6XeRHaZ+bFAThqwoZ4G4/DjqMcoD9oVSROTXYhi9oX7nDj+8Wwa7I
	kaQTlY9yNPAGD45soGbx6uTommPHlOmNU=
X-Received: by 2002:a05:600c:6286:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-493e6892d8bmr85984235e9.8.1783629660007;
        Thu, 09 Jul 2026 13:41:00 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm87100785e9.1.2026.07.09.13.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:40:59 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI7 R2
Date: Thu,  9 Jul 2026 22:38:33 +0200
Message-ID: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ROG STRIX X870E-E GAMING WIFI7 R2, which is a copy of ROG STRIX
X870E-E GAMING WIFI7 sensor-wise, and thus enable discovered T_Sensor
for the original board as well.

Vishaal Saraiya (2):
  hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX X870E-E GAMING
    WIFI
  hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI7 R2

 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.55.0

