Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110353;
	b=30Q00WWCZPP5EfeGUWmAmi54AF6GdAofIgJmAio26Xl9oiQqXKFQ7R/X0ZrU7KTnVvAC
	 nZ9KxJ/10O6NaKtoErntyN6T0BRE2fIpgOhIAMDeOpKdkvYFSBloQXUR8WoTVEF0oy3f2
	 qXk/F6/+CqU4Bo9rt7cAD+RozfpNQ2UuxfVTUgrxCzm7iS6KQ/XNmFalLlCrTY42W3Qvb
	 hihg/NM70LESKOsH3x0Fdd04iUIk8D6MeBxvXAo8VidAq1qrI7CLFcLxwCLyzgjvlVwP0
	 NcVRJt1yZc9ymWppFI1yS3oUs2lcNoZ2rcydpNtMGE1/cPbng65t9jx0TY/vzxwZlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110353;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=kNSq8YS0MzqXQMz+qhWewxE7D+zycDvnzl+Jd8bnJ/w=;
	b=fert9er5q/3KxzCh6qw3Jco9Mb91Kh4ELFiqW5lgOvv1ZSd9yVrnsJNtLntaHz0SFjy7
	 +pedlvwekthUy4Czyk0EJsW1IH7PlCjyInd5Dz1IwVxHi4TEvRn6TZAy/EJ/frZOen2df
	 0qyQ2h5AxOMlCL8Z8lUmQHcrMJ3qsGdAM1l3hMDfDuhxn6M721lFpDNwm7zIiiPY1W77R
	 MI2hZrNYaSRHccU/vAKvtG1CJ4+XRYx2rhkyEvP5FTYjb6Lslw+DWQMuFPa8J71Md/fP7
	 5LKohutQNud+KKo5o8g1LqA6mjxeMWMVDjjyAfS0HOnHSxz0hDYBpnYNHzE2FG2Ff9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b="Bn25/TYO";
	arc=none smtp.remote-ip=185.136.65.228
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD75606A325
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD75606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=Bn25/TYO
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202611191745494b8c82834000020798
        for <linux-hwmon@vger.kernel.org>;
        Thu, 19 Nov 2026 18:45:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kNSq8YS0MzqXQMz+qhWewxE7D+zycDvnzl+Jd8bnJ/w=;
 b=Bn25/TYOWmZjzgozNyAVW0/5XgO1tMkJKf82pU+J4pwYHomqhKpu2ksBNxdFDZA6lQwjUW
 6rvRSpop467sM4TstXJnlg0C5w6Bhs9kMaR9LzLEU12O/H0LUvJDotBeNeK7G75WjO3lWTy8
 OaqSyu6nGFGiVGo68QdXqrgrx11K/nBKx/lodmKJydtbROTiApP3Ww0rp1IN7nQ8b/mlUZ68
 JAdtaaC38lUfAS0eShuOIASq7dk0Zeju/wJvGbagb/m80SJWSzAcZt+Q0nE3BtCRwLYqJHSa
 5RKCmd1dzRATQIGCvQ1ywRkH/BX4OYHQqYUwzvA4O22gkog+qJO/JatQ==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH v4 0/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
Date: Thu, 19 Nov 2026 18:45:46 +0100
Message-ID: <20261119174548.1324539-1-benedikt.niedermayr@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Hi,

this patch adds a hardware monitoring driver for the embedded controller on
Siemens SIMATIC IPC BX-54A systems.

The driver loads directly via ACPI "_HID" which is reserved for Siemens.
See commit for more information.

I'm not the original author of this driver but I reviewed it as carefully as
possible and I would step in as maintainer for it.

This patch does not enable the hardware platform on which this controller is
present.
Instead I just routed the enablement through the i2c tree, which is currently
in review [1].
I wasn't expecting the review to take that long, so it's maybe better to route
the platform enablements through this tree instead... I dont know...


changes since v3:

- make patches checkpatch "--strict" ready
- add description to the doc commit
- get back to static declaration for temp channel config by using is_visible()


changes since v2:

- fix: shared mutable temp config array in simatic_ipc_ec_hwmon_probe()
  Switched to a dynamic allocation approach for the temperature channels


changes since v1:

- fix typo (drviers -> drivers) in a comment
- improve fan speed decoding (my own AI finding -> considers little-endian)
- Sashiko review:
  - add documentation leaning a bit towards asus_ec_sensors.rst
  - sanitize chip_name in simatic_ipc_ec_fan_probe()
  - temp channel config: Move to a static approach.
    Use a static array sized for the maximum number of channels that fit into
    the 256 byte EC address space.
    Also reject configurations (from the firmware) that exceed this limit.
    IMHO this was only a theoretical issue since there is only a single EC.
  - fix uninitialized reads on ec_read()
  - validate pwm_enable
  - clamp before cast in simatic_ipc_ec_temp_write()
  - fix pointer-sign mismatch passing s8 to ec_read()
  - fix wrong assignment to temp*_min_alarm and temp*_max_alarm


[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20261116142351.1228943-4-benedikt.niedermayr@siemens.com/

Best regards,
Benedikt

Benedikt Niedermayr (2):
  hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
  docs: hwmon: introduce simatic-ipc-ec-sensors

 Documentation/hwmon/index.rst                 |   1 +
 .../hwmon/simatic-ipc-ec-sensors.rst          |  64 ++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/simatic-ipc-ec-sensors.c        | 578 ++++++++++++++++++
 6 files changed, 662 insertions(+)
 create mode 100644 Documentation/hwmon/simatic-ipc-ec-sensors.rst
 create mode 100644 drivers/hwmon/simatic-ipc-ec-sensors.c

--
2.43.0
