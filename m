Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955C91A8F84
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168683; cv=none; b=PcU3yy8J8X/HVxgWChnPukIMyRw4gON7DtY7qtDxD5A53io93R6iwvXNIMtO13Jl1O5wP7Wo6opdRnvUsmkQUZe/R8/wmvhjpBJ9QhNNFOUrGucsQKt1UbUNfqty3qAusKAg+4/NmvI2aMAMfrDSdTggTTAET/nzycCsTf965oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168683; c=relaxed/simple;
	bh=2t9Sx+hEy1MQQIjH8POIruIdemvvg7gZoGHUwS/RAZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpZ5Lw2diJ/CdB86GKsRVhxyRcrFVwLpqod+YwmI6mPYdErclZrs0DNuVe8xiXpnixKxYvTshQmB/KWSbkk6zmfQtJ5R1ypN9DT50vL7cE/7vxbFehBMPKKl1xzrNeaNVEKcYaCOZbvwi19SraqpfD9wZXCHGL5hqM89dITZ7E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sf2kwaDt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sf2kwaDt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371bb515eso25610685e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Feb 2026 07:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168681; x=1771773481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4f0oW5QT4Uco2RXUao1ZgJsTO+wE8vwc/uuU08K7h4=;
        b=Sf2kwaDtoTB39ZLTosH2odZbO40q7Z6fgeyo9CBcffJO8Wk7OC5uFirU+SrScA5mrU
         GDm03O7bco/WEfK7xZlVY4q6aYwjzyvZPCjio0dZLCliCX3ho4rKeBmfKxgawQMaKf8b
         BjZgbJG6/VRFSz5jvatCB0HGiX1lZ+aE4QFBvjK0ukms5gmys9TimIr+YM83dSfqp0h1
         Ct9opuP0GBgUWPHFbZBy5aAIOp6o7eqrJGBq0cHAUFGiZsrrTaExg2gOvpfjWK9Lx7eX
         dNBzNMY+Gy30Jq4QOZY8hi+lHaEAHgE5I/t6FxRjG8nHlHi+l92Ol5t7D/dil4Hl3t24
         ILew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168681; x=1771773481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4f0oW5QT4Uco2RXUao1ZgJsTO+wE8vwc/uuU08K7h4=;
        b=nE4gwZSkWWKyXJxXfQ0fdGutLpIM3DtdouQJhPh/UlIC9K1rWaJO/PJZ4NA4ZNHVSi
         EX82gAkZ0JzzTbIzbwc/jtR9m7jV72SlPRx+jMbVMCcWv87T4dndvDdjHhs+BsSCWiI8
         ZZ1Ulye0rR0tqBICl8D1vnOZ5SxwbTkgCU94HLrS9ArvPjUW18yOE2K2FaWDhcjun7Y/
         Y8ekbPgLD32P04cQYRSk3HXDcbYrJQ3Apt3ghQtRfyQlZ8hrZj7sgjkTlz6j/aSsIJVE
         d+mw6007vBCxnqAjn/96FqofmdNSgOuInQtLW9v4JXYZb+4amzLYhnjXJwEFsP7zhAVH
         kktQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVykLkAGtJORGr/gfrxrb4z3gbuxpoCe6JaajrShfhhpPu2I2WERye2Ck2EzKf2im0ZdvfOu7yoMa9xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7CvMKL3bXUlOFmqrE3SEhMSW17orbJ+rvdqjq9eoOIGRWyxfl
	QFFl5tVK4W22egKdlpfiWZvAcHbQW5th0sBAqdM6DXAoMWBoqanyetkW
X-Gm-Gg: AZuq6aLhXp4PC3s8XGTjzLbtdyN3wu/nf0f/enX/UjV1bP6OBfiL6oggro6xIrLROTi
	H5XxRoRyHOtchm/wQg9HPz7kpCo+Gnf/8pARFFj07+rnyWDYqb0WXZrer0VR5dQwuOV0fqkstEJ
	9SeQ6gYfwaLQuDYtHUcJtpp3aG2VVD9eb582WGk9jHLHsFzQKSndi1Nf//R4ZeAvQdFWYu6aYe/
	iDzh7QbWzo1xTvKwEyY8nvaPweh2ub47CMmeBcuCPkn5qAFB7SZPliV32kTVnF5ynBQzcalHUGU
	nPiwpCVSQeV005cujzC9oZbZB33BE54kNjYTbh9UIvEoo3DSx+s0AHMS8jnz3B7pt4iOVqEMPoO
	6TYAdE4BnThUb8noDsNlU1s1MU3jzmXhjc8gq98NrOlHBjpMFuRqkmpS/zkA6NhfxgnS38PlyZu
	hg9zG6BhU0IhDtZn2uvzc5GOQN5tYu5+NoVOATQg8O4w==
X-Received: by 2002:a05:600c:5299:b0:480:19ed:7efa with SMTP id 5b1f17b1804b1-48373a7a0dfmr105217585e9.36.1771168680867;
        Sun, 15 Feb 2026 07:18:00 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a29c13sm63668925e9.16.2026.02.15.07.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:18:00 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add ROG CROSSHAIR X670E EXTREME and ROG STRIX X470-F GAMING
Date: Sun, 15 Feb 2026 16:16:17 +0100
Message-ID: <20260215151743.20138-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215151743.20138-1-eugene.shalygin@gmail.com>
References: <20260215151743.20138-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for two more boards.

Timothy C. Sweeney-Fanelli (1):
  hwmon: (asus-ec-sensors )add ROG CROSSHAIR X670E EXTREME

Varasina Farmadani (1):
  hwmon: (asus-ec-sensors) add ROG STRIX X470-F GAMING

 Documentation/hwmon/asus_ec_sensors.rst |  2 ++
 drivers/hwmon/asus-ec-sensors.c         | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.53.0

