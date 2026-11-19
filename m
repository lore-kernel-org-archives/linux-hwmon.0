Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104139;
	b=G27O4aNQ2UIwz2yL0+jtAwe3lUe32KVhrtA5Tcfn4+tJoCYKEylcC+QtXc7pjHc2nU2n
	 hu7q2Pga9b5y9O3gMGQiS44kznmfKJtxuTsXs+jGvBHQ1MKTBLzMjvAi4gqFSMvyLkEY6
	 br65HjIBt+HEog8Fm6jKSbgaxkBLpcTxgPnodjkHuBzdnnE4LEH2smQnNH4bRF36/DPIH
	 BWM9p2W/mE3WJzXz6wNoRZIitYfc6eLsxF3urMxs2jbueLPVvmAJ8y8J1KQhV4Y0lHn79
	 /ryCZXqM4fSX6LK96Cj9JwRCQ3CLc7oXfrlmcdlQ1VLyRzVezFFTJVoU+/XdSigIfvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104139;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=AgflR3p6/R5M7BfyiF1Vf2tZRQtwVMkYYsizTHhDtUY=;
	b=cBo6xXQWvQItaz32W7k0H692afOPt7IeIEIF+ItOxvzv3Wrn1tBzk12r4cCNbMF8dUGk
	 hDHsBYLC6LUaB2honDdc+D+XXqhGJeH86vI7/czvcTc2A65h9i1xEeVdZfekfTBzF6RmR
	 vKpyspKCvDEGWGrZMBHp/mqbcj71enghA7JEBJQwtPJ8DAN8BwMIdD9erlUzqxEymY6Ju
	 jxzTQnDYPi9DUFWSCKjdse7QC6z0OKYnFMKUMa4AeLGxnUMspAaeUPAin1l1NdcAnQgv3
	 HcEW1w6EI6HWZ3cf55JzNuzydjd4nYd5IimyWRuVBuJ4fTuGl21qcB13FxY4+oWPzYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=fKsCfAWl;
	arc=none smtp.remote-ip=185.136.64.228
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EBF60A2639
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 16:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EBF60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=fKsCfAWl
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261119160210d386a0108a00020707
        for <linux-hwmon@vger.kernel.org>;
        Thu, 19 Nov 2026 17:02:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AgflR3p6/R5M7BfyiF1Vf2tZRQtwVMkYYsizTHhDtUY=;
 b=fKsCfAWliEAuYm1Z4I4tINAbSSqQb86iJnBpdJLkUNC5DZR0M5VERT7PR8RfHzXcRm0keo
 +uubKBUa2jLcT4qo/jnRrS1iM1YrhdOe3rhBw43AcmItNM05GkRf5oUz0Pkk9qlrcHQSanTC
 OMq/q3e0nCmSvbKl/d6Y7cpodup+aOj4eEykFnDyldieLnUDwaB/LtbGt2s71lXB6KG7ybkS
 um6R0Ps1+sSdIY0+eYzEPZ6mtddPSvIh2uJi4ovRLEOLnxe3sBEJ9zMnmH8o8ZoaSC/jpoK0
 Evkpa7s/3HkSS2B3FCgPinmADo7o8aH98wGaJ2MHXJa64hbSmBopXA+A==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
Date: Thu, 19 Nov 2026 17:02:08 +0100
Message-ID: <20261119160210.1257890-1-benedikt.niedermayr@siemens.com>
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
in review [1].git l
I wasn't expecting the review to take that long, so it's maybe better to route
the platform enablements through this tree instead... I dont know...

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
 drivers/hwmon/simatic-ipc-ec-sensors.c        | 577 ++++++++++++++++++
 6 files changed, 661 insertions(+)
 create mode 100644 Documentation/hwmon/simatic-ipc-ec-sensors.rst
 create mode 100644 drivers/hwmon/simatic-ipc-ec-sensors.c

--
2.43.0
