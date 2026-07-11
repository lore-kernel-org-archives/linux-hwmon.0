Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2F43BB9EF
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772992; cv=none; b=GojaACoYYb8MAqdWPIkX2XhpsWC7Ru5tFXe+xltaLrJsL+EhnKTqoEX9+q2eH1+rX2b0QVbC61I8y36xNpPupB/P771WTpoMl+q3N9KmhdMV+chBzoKueQlpL5qdzg3ftgHngJfMH0lIkl9rHsM0gMIyqxqAukjyWyj5oVcqd7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772992; c=relaxed/simple;
	bh=ryYcUF8ZEGtCcLlptxCoVjdI6mO2AD5GoZb6OhWHpYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q3qS3PbHI/R2iWdI4gEwppzzsA9qWP5r31QuFxEbeda9hnwuVcPVYxeNzXQRQD++ivwNseedrCukFLXljCmWa8mKI/G22ag6qQuaiVjM8sYIWaKlD0/mXAxHNK4dMPMFvFO0Jm+PkYY84uF3TS52tkX9bcaqRwBaex/D4fQKo0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyl9TXjD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyl9TXjD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1480863f8f.1
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772990; x=1784377790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wm+/anItRPAOMTZB8F871YqoZpwcZIgSLOZ4N8FvHYo=;
        b=nyl9TXjDzZrMmQAAoBdOgsXR/uiCNvHLjg0dqAPIyKlj+r511+vTPjeWNW8f7KvQKh
         w2UJWQPU4ajXJblhz2+SI794o2qtsAPphzGmuUbnI8QcA+TF47/UU8U3iWID4c4mEkK2
         Gz66YqpUXpe914WifJYcHXzbpejnGlAE/CTMMlTMkFRer/yXFiG3ihg27qu+qZ5uNdH2
         O2pBZgFIYwWWxoQT8GsJEZPCbJvzwmbLtCKFuLbQRd89DSbuqd1TTuSuXAUR24UM6Ab3
         Z+fVKj2S+X7cxDJk/+9/j2eZHw2FNGpVBvsMp/ara/ryktimcQPgVHeKLS5Q1QvWkGr4
         wYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772990; x=1784377790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wm+/anItRPAOMTZB8F871YqoZpwcZIgSLOZ4N8FvHYo=;
        b=T8AuioWbIJ/KJNH/gEMO2Xdx+an+AA+TT8ijjRDAo6ASzVFl+aGl4qgUKEkr0XnZDD
         lW/eW6U4F/fdmzhtqspYyrlvu/x50rJRCHhtz5TG/yStp3hZrdYLTDgLqVPHQu57KEVc
         w6a0pvwJDdxishZe1fiEKTaa3YBw1SinsIgtp7NW4Zr2/1SX12MMnrGBcWcB18M7E22W
         UKxcqQ9QKKAx/sUYh+3LtEIdDbq253ygJh0naAWDzm5OSN3wxKool8oNuinScAcBTkf/
         4Z9JSUnTIEkcVxhIoKHP716lUa5tbupftwKeJgRhPJWJUWxnFasVOOnATGvOn+8NGaG/
         bzoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYGvre7EM/OcLWQvCN6sXqG7GI0nyNpkPLVK7GQFt9ZWGC83rp5Zx4s4uRjjaJBtHYuXfvAEveJcOMOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTkgoM7NfUfbbPhmcGob4VAE+VHLt13VtkVy8sVbv/fy+/3zA6
	pBb7rooW/639qqwt1aZZR/R6B26HQaSZpFGdKLjkvZUoEGfwWmgSPr+2
X-Gm-Gg: AfdE7cnW35BHVMjYzHxoiKeCBBeBUFhcubJIH+3BJZhXl3C1REYyGig+cYv3wGcJwG5
	9/J67/MBSLIJGpE19Sg4iIWGhDfD8B6lyXnazgdqNPFvxcNCoX+xDOi01R3LANRPRB5GmNp3y1M
	w/Ifh5SDQVAAVaOqHfNJzdOD9xmrWWwe9agugIUMAh84b7DqMwVCwyTn8oUt91vBi4UV+1EUbnc
	WtaSAFLiw8jyk/MuIJQp/ccQJRuM+uD67wbD8fbjnd2jGl3EypO4Hgsfm3Ej+98WJXIZmEMBIo8
	XiLvdIDe087/iCl6FDXYPFGSHhe6N8nkWuEECPKxDyynVCi7Fujcf5RnQSm1cKjM2ulpd/3H9zt
	hB2btWd3+GpBskYtFElzaWW6SPMw0WbmqAKKwJIh5l0VjkrQMmLVaO+iZRFzU9Bj7hmErQxKP9e
	LEbGbLoh+fniJ5Oli6YjCm27nOT8e7njU=
X-Received: by 2002:a05:6000:40ca:b0:47d:fc20:e7b4 with SMTP id ffacd0b85a97d-47f2dcb5c7amr2939381f8f.10.1783772989883;
        Sat, 11 Jul 2026 05:29:49 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm68964718f8f.15.2026.07.11.05.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:29:49 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 0/1] hwmon: (asus-ec-sensors) detect unconnected physical sensors
Date: Sat, 11 Jul 2026 14:26:43 +0200
Message-ID: <20260711122937.594989-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3: apply this detection only to environment temperature sensors
(T_Sensor, water, etc.), but not to the VRM and CPU ones.

v2: make temperature_blank_values array const.

Eugene Shalygin (1):
  hwmon: (asus-ec-sensors) detect unconnected physical sensors

 drivers/hwmon/asus-ec-sensors.c | 49 ++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

-- 
2.55.0

