Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8AF2D6E5C
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123299; cv=none; b=Aogy5XKa7chYiHSYR3Ze+Z6PV1MEYgZdlw+tnhi/1JZ3D6TxlPDZAtHJ4kOz4DjIleZJzcCN+g32m4Cwy49+Hh0jKyNEB76ZtqQJ0OOAUiSzTD+zh5EJfNv4utY/5LbTU7gb4IQcnnPrUGj+QXRJ7EamojBmeRMctI8mvBMuPqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123299; c=relaxed/simple;
	bh=mypkqfjE10QrOrLeaSmkNsE/MjpAHqKIaUmjxeM8X2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VqgIlQ7p/dBC0zzfTJJpHF5UvnssBzOoCQVfXrrY+wkjTi1q7fLg2uGAgYimN5MPT9iNtlZiiG+wPR7cQmw6wW6JoeDFFby7nDgbQoJGZt0/mwx6dQd3cGMUfYYmYY8C1bUFECvkzqBo1q9wxellPwNWjfa0JR6h3lraYZUkUeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWWIvRtc; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWWIvRtc"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6679d88abdcso2705285d50.2
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 20:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785123297; x=1785728097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=niK/nakUZpSGEg2j0Nh3swPJXfDGdMsGARQubOaz6jE=;
        b=qWWIvRtccbBX17JDufimgten2IVvDqIYE9pfDDletbnHpLByuySXOH3Dk4oeNdwCVh
         XjBAnjtumVOtRj50GNOlpE+ywpwPmxg9lRgXJSxrhfDT4Scjmlamvc6rg/g/y+kQSkWg
         lSL4/fZvQeue5k7UgFf9ZHmX6dDBvsU4qTrupNxQ+0hLBg7iPERqs3Wi5/82LpNEzKXC
         TmjNYn8rGxhwBx5xNHxubW0eZe1VTggzyzCcv9ZKi5LeMpIwoqlQXUcSCP94LSykn5r/
         Fr8LdOu0dW47AOkYr8nJ6g1c0/NFjlGLwrgzGBAU1YFy8wn5IDGuDvblevUMQgkOL9fB
         rGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123297; x=1785728097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=niK/nakUZpSGEg2j0Nh3swPJXfDGdMsGARQubOaz6jE=;
        b=l19xFWxNkgaUDML+von5UKiX9T3RO4CdvNruu8H+uCbb8mcZoUYHH07fiW2yCMDssJ
         GeB7FCRxGJKXl/islaD9mot0bnh6gKxYxYw/2bMExW5xmo1ltETIw47dEnSehUpbqRhN
         IxNIcyrTABCRRtItJvw8uiusxEXwFAa4wIen1AcyT1tummm8viwalsPVmPqL0jEcQf1X
         RTvfy2yBMRvB+Mk77fWkTVfOCl/PS5who5uIp75CpFEVVjNiCcmUQjydHj3Dmfxm5lCz
         8yQndGwPSSPXuy50noKHNCZHB+onHz/723UDyYj1sDFi+lpI3eKU6GQVWqsMX9V0sxtL
         Z5tg==
X-Gm-Message-State: AOJu0YyNkFnUx1aLNSOF5T/c9MqresHI0XUx3CJ+1srBLo2PicFSt9oY
	/Vaiglrr9R4DPfF+KL9k4yQyidCN61b7RJ/CkfHzyw2KLzMnf4iYzZcX
X-Gm-Gg: AR+sD12I3dd0matrShwfcz98lyiufma2iUfTRkYNwnB2ts3l9qTO7OjiHjoyv2pvxxB
	Rt/a/fLjNYRjSzeLdq/bx4GJ0q/NZcepvZQSor4TIaaiFDI9pNFT2C0KP8uLspnN2OXcECIN7wa
	WSVMTG8ldJ4z0QBqgoqpTJSj5RYC1SSoikWydHAaOdkYTxtehxdrmX/mHY+kfm37zaKcvJqNRac
	KCrIXbJ61u2PTP1BwBpeacPhkjJ3BCP5LYXjQ50jK9NLVHXuwgaYzs/rSNvlM7gdbJj34Fu3ugA
	zSBsOljiEMqsfPul2jRyO1nI6MagmMO0IuZi+h2L/DONBsHOCjjZkH/Ld/8TqERlaW3Resf+k6H
	BdJd/lJy28bjpa/ALqo2HJz4l6/kPH61TBLbszyp79ttElfRoutYxswzvaPagNfEUfs/3WoOZQX
	jyT8hMC3HCI15HUAmGoQ==
X-Received: by 2002:a53:d013:0:b0:668:1414:e9b9 with SMTP id 956f58d0204a3-668c79af8f7mr1707873d50.3.1785123296583;
        Sun, 26 Jul 2026 20:34:56 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d63596sm2751525d50.6.2026.07.26.20.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 20:34:55 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [hwmon PATCH v3 0/6] hwmon: (adt7470): Multiple fixes
Date: Mon, 27 Jul 2026 00:34:37 -0300
Message-Id: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3RZmoC/33NTQ7CIBAF4KsY1mKAltK68h7GGIRpiymtgYo/T
 e8uxU0XxuWbvPnehDw4Ax7tNxNyEIw3Qx9Dtt0g1cq+AWx0zIgRVhBBCyz1KHJBzmMLzsruPfS
 AeSUpYUyUWjAUP28OavNM6hG1DxvJ0/fs75crqHERl2Jr/Di4V1oPNNX/DgWKCVaKc6gzDlrDo
 bHSdDs12LQQ2NoQvw0WDck5zUXFy1rqtTHP8wcNKPMbEwEAAA==
X-Change-ID: 20260716-adt7470_thermalzone-59a102278d72
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

This series fixes several issues in the adt7470 driver:

- Restore PWM configuration after I2C failures.
- Avoid cache corruption after failed writes.
- Prevent busy looping when auto_update_interval is zero.
- Fix incorrect temperature alarm reporting.
- Cache the PWM frequency and fix error propagation.
- Correct unused PWM auto-mode mask definitions.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
Luiz Angelo Daros de Luca (6):
      hwmon: (adt7470) Fix fans stuck in manual mode on I2C errors
      hwmon: (adt7470) Fix cache updated before hardware write on I2C error
      hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread
      hwmon: (adt7470) Fix swapped PWM3 and PWM4 auto mode masks
      hwmon: (adt7470) Fix temperature alarm logic in hwmon_temp_read()
      hwmon: (adt7470) Use cached PWM frequency value

 drivers/hwmon/adt7470.c | 80 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 22 deletions(-)
---
base-commit: 7e12ea5aae19ee07d466e9613ccba753349c9c1d
change-id: 20260716-adt7470_thermalzone-59a102278d72

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>

