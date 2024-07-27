Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681B3B1AC
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722091108; cv=none; b=DsGoDKreO2encQK0V36glQ/c1jnhBZGN/KMNzjD8gXOD0euwWsAOHBhgC+LmfvHtSIfvldzlv/VVb1KSnWvil/oeMWsFqzCjlFzASHdizoF2vKUUnLqHFLWIj8YKv+272nsVyxqGsuvyOa93ZUhJlFEd/ikXsNhWficZ2PMR0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722091108; c=relaxed/simple;
	bh=6lvliN6CkovYF3uXdKN4aC8/jyw72hOG3d4QvdbQPLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AcOpgh7/1o9XC0Gi1PRDwSzBMgDQATa5RRD3/4MYy0jsYgoJfAhVES4cp00m/o0u3otEgpkrn3Bc2Q47yl7+0tehIpAkAfj3vukpcx2PAKkrCUJoM2V8Fo1VmxkxpaE0DeonBs6SU7ra5CoUosaVLGBU4i5fKyOC81d3BPfM1no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvYuuWnD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvYuuWnD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc658b6b2eso12480205ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722091105; x=1722695905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=12bdlcwCCff7WJtnrMj9qFi5Xw5MKQ+9CCIvGvocHZo=;
        b=VvYuuWnDXDOUjFPwEghkozVNSoOX6hopnbrzBUdzlaG8IVHbM4T8csgFjK/ysDiSuI
         m7ZKB2Q7QSu5kiw4Dh78U7FKVkhY6ItqlwjFQaXk8WVm8bT8w8dLtxJCM2xfR1RTLmxu
         nIa07j+LqaHMkIoprBhFAPuHYu1+sem1KUNfCFl7BtpLgKWIkDFkBq1ykUM/l2gIxJ2O
         nbQJSF8QBZ98jM3RZJS7Ab/UKpOQKfZhxYYld+l6ciQrq+JHMgbTdiZwV4teF/Rdi9Mc
         JBgIxCj6wTqt3oHOv/GWlIzMBzh5hHfvBy6m+kaN8MCKt4L0HP7yeG4XbhOkzobhl86V
         qH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722091105; x=1722695905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12bdlcwCCff7WJtnrMj9qFi5Xw5MKQ+9CCIvGvocHZo=;
        b=tDB8e8WA4dZwaJXQVECzCdKQMZkSXN9ZFbEfXeZWqdsHm47QydNmrcqyZPZZESB56v
         aE/oWI9w/iAj31hC8IWNQPuR935VygJwbSYcq0RyJcdAbjBF3wWgR8DR6wr1733lJ/9Q
         hu2dN2RG9NDmte3/2lwZvv3MrpmQXxzox/FKueFbsnx5stK7q5ZiQSbffSryppIIbeRp
         dXCvNsXZw81HIV2bXLeQQqQ5sE9KTAMQxKNjQ7wS5mR2+Fe8g5FOz6NUaPMJ5oBK8DyI
         dUr1eH2zyG39Oy5eDH4wNbzstJk7UK/ZcHjDNTX6mLG5zo0TIjzJA1JOlsZ0HarcIoQ7
         yjYQ==
X-Gm-Message-State: AOJu0YxrB9K5YRP4E0L6kWwePHjKm+DurpzgwhOIgz+ZTHUON/y9G4ht
	OQ1MFYNlTuoH1BqSvniQ/Xjn3X+ggnFQrGF8iy389I0zHAWcOuYuOvp7DQ==
X-Google-Smtp-Source: AGHT+IHlANiTdMjHESW+/SmRAPqTlW34fkAZyKDmwo78AOp65T/jeyQL7l96B8GJS7xlI2usrqyvXg==
X-Received: by 2002:a17:903:41c8:b0:1fa:fc69:7a81 with SMTP id d9443c01a7336-1ff0483157amr30965825ad.29.1722091104921;
        Sat, 27 Jul 2024 07:38:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ca8fd5sm51437235ad.64.2024.07.27.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 07:38:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/6] hwmon: (max1619) Modernize driver
Date: Sat, 27 Jul 2024 07:38:14 -0700
Message-Id: <20240727143820.1358225-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix limit overflows, improve chip detection code, convert to use
regmap, convert to use with_info hwmon API, and add support for
update_interval sysfs attribute.

----------------------------------------------------------------
Guenter Roeck (6):
      hwmon: (max1619) Clamp temperature range when writing limits
      hwmon: (max1619) Reorder include files to alphabetic order
      hwmon: (max1619) Convert to use regmap
      hwmon: (max1619) Convert to with_info API
      hwmon: (max1619) Add support for update_interval attribute
      hwmon: (max1619) Improve chip detection code

 Documentation/hwmon/max1619.rst |   4 -
 drivers/hwmon/max1619.c         | 482 +++++++++++++++++++++++-----------------
 2 files changed, 273 insertions(+), 213 deletions(-)
