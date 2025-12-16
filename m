Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA442F39A3
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874360; cv=none; b=ZUO+2wEM0jIGSN0IrsMcMf/HR5Bfs+6fzj6JpSMjNBeV07bpLnJnIWcn5LgT5elVjKM8GAr9rl20cvUYGwk3MW3sfQ2EfPma3h5o3pGjabwJqENb+7VNzijLVVa6jZYsYTduvozQ97/n/H0jUXeuBVtW2rISDN2rpml89eu+Px0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874360; c=relaxed/simple;
	bh=zo9Tk24mJEWKWnaU5R7lj/orr0YWDEpIPJ6u4TRs66g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qjcWvyQNrRwDHKoTlu4+dNO3l3dbvlM0jcQT/wProu4+38E+mS94FU6/uINZW29riiWK4pD/AxVVornz7NYErenupD+nstplQ7+LwTIepXTRhfbnsG6dgnWKkHJEhIg75w/4/33PNgfm0UVt2S+HSt9FEeO2WR+cwF/+vivkpZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4MhlXo1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4MhlXo1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f30233d8aso42438905ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 00:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765874357; x=1766479157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtBBDsxCZvMwBu9/APA2tURxdHtKXFNsEHMBnLQMgCo=;
        b=E4MhlXo1LnJvmJ4Lbazm8JgbYI3Em4/yN8jJM2OGNxKBKEIIVRaGj9HOpBDGTDichb
         wRRI61c33WZSbZRtmJHU5HJDQs/SXaY0jRf80nuVDqfp/TXlgk9jBuQ9IAIQyD1QVLlK
         vybRIadmw9hLvhcLwEr46zt19V566gt2FxUjqiNnQWrfREGxT7Opc37BCO/fbkgWlYKR
         Dh0F4DIdD/inLxrM5mZJzG7fJXL55+d9dCUf+IgYQEcY61KpZhvMSLGG4OKvODBEWqbI
         Nk1ePswHZgbOiUQEJnE8tgWUfPrIvi1Wix3Ayl1PG3+0EIdINyTWYOG0iYR8ehUZrxrw
         i70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765874357; x=1766479157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtBBDsxCZvMwBu9/APA2tURxdHtKXFNsEHMBnLQMgCo=;
        b=NG0fsJ3wr3cM5ncgz9tPhAFXibcJbnpzPnYcXjStR8R5CYLt+vduwYnrCJ01D6cbaR
         YbeEgZ/qO7C0XtO8tA+wuLCMYCw0pJpHefhCuEM8JD56tXyuFcIH+DITvSC6XcllvJ9p
         qbY9UZYXUAYz+DjBIkHwOXiLjg68jEWu73qBBkFmyQb1BLAYnnlLdTAYnbrJaF4/DyQo
         fboRvvLaCwZmYLU3JOUhOFceWVge2Tb5E0l0VE1kOUj+xtdn+OW53zNF7oCPCL/T09Cz
         AFqDu09ywL5ImB0B0CjLCGpaF11Q7vtcV6hy0EeYECdpdNhk2Xs2ZfMvqxmswTSO5i1U
         PYpA==
X-Forwarded-Encrypted: i=1; AJvYcCXE9mRLYxpggt90lq4csjOfKMCoQdcMbOk4TCS4iEE9qhj/otmNhGKH3sIqqmBEyz/usLuqxKKWEZ9uzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpcGtjYQWSdpZsmn8Qj+NLxFxinYbuv82RGDT/Puc891axoHdi
	3F/WYUQg8Hpe9qQ23v/VPml3+Wv/87vfWd7+6mBgGriV1X7vWwV5PzKngvPhx4YK
X-Gm-Gg: AY/fxX4Y+3GCx3mNMDxTS8WMzt4CqkMWmPh4Fd0oRsl2I3F3z1qgRUyD7Q2Y2r46gj/
	2oZ0wI+/68AgNk4mXVRTzkulrjxHF2o8otMIk5xP6QaEkKny52qNcB/hpqJi5OJOpLYjsFQwGFD
	YvcQtTaI0pI+sY4T8H9ikHGDdwPrqVL+O45GVDHJLDC+V+Eol1bvwBX5a2syaDTJKo8y/RpfjeW
	aX0cNXsG0NEFGy8DkxkX2SlBlT6uZyP1A8ZDjimMj5Dbii9K8vana//miXh5bw/eNB5o2tj+567
	0k4dUjpzLyjXxfMZ1ULAkJV8S/hlZ7yuHIY59wFYbHgQshT3tbknS+gGp5GvJfsqPQmNhHq/5GL
	wEBMUqkAJWP0H5TRC18Tt0og9yiA24asW9XVRAXBe1kCTE+3hqtzhFa0k7ICpYZ6nHQU8ORxzs8
	HrNpvdoTa0qNNZGHaUx5XlD7UATUYbakpvJRT/HyIq01BZ1Ippc7oBwH/ULm8M8WS+r8rpwUTkb
	34mS3NkQDBu0tCz6tGmBAa2n/6cNQLCjU843bkW2w==
X-Google-Smtp-Source: AGHT+IHfMC0Xz7RfUBvRFUFdTN+OBR9EuSgsgKej8Ja11VxN10DWtc/VOi53tNDwnLbYc6WPqhb8OQ==
X-Received: by 2002:a17:903:32cd:b0:29e:97a1:76bc with SMTP id d9443c01a7336-29f23b5ecf4mr143760135ad.21.1765874356839;
        Tue, 16 Dec 2025 00:39:16 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b37417sm155060205ad.20.2025.12.16.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:39:16 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: add STEF48H28
Date: Tue, 16 Dec 2025 16:37:11 +0800
Message-Id: <20251216083712.260140-1-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the STEF48H28.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..6a020385a58e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -417,6 +417,8 @@ properties:
             # SparkFun Qwiic Joystick (COM-15168) with i2c interface
           - sparkfun,qwiic-joystick
             # Sierra Wireless mangOH Green SPI IoT interface
+          - st,stef48h28
+            # STMicroelectronics Hot-swap controller stef48h28
           - swir,mangoh-iotport-spi
             # Synaptics I2C touchpad
           - synaptics,synaptics_i2c
-- 
2.34.1

