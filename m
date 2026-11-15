Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729753;
	b=nRyLVwtZxWfKtQywscAdVMOfOGs/gH3DUTD3VHd3bB8si1D5DxUnYw43+jFsuOnpPftZ
	 nIhsbY4O5gcUF7gvlWuowYneoM0rgKKY18A5tqedzH+kLHCtAUsDPXjaPpBHmReZn1B6g
	 tHOm0/z7hjCA924WL2sZbVX+TGxwggTmRdgDxGLnlT+qdLXFyvMWsWGksUgaD4UQWb2wS
	 zpt8om3VteFr4rDhZ3T7qIFev1lMkk7czowasdB9JyoeUaEHl9d2Y0r2SeMUTTnf6Irve
	 R3Ed4nI9Rvd2wE979iVeyIyq3lgKePoFZ6FAC8Qsxt2CvgGTLcJoUdhMLKN5QAB1Shw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729753;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OapX+iokibpyEzcdY1VjeGvIXarvH9elHqEwWQtq7J8=;
	b=YWdKF5cY58A072lFOPoa9e9LKjmuRIWsPgmJbv6l7e66xxKxIZkT/kV0wqJdTSaJpQNX
	 aGs2n8C24dW7+NmUbk4Pzge5DSACqUh+WywsDAZBoJYcMjF9kHEaDlsYs572lMZKJcbTc
	 0X8aQrm7Wz6mcw1KrZfmpriiC9NwcCftWvC5lKSBGasO2duVx2vxs/Bflla2Fx3ACptIO
	 m2x4Kb3n5nsW/MDQxIoWhl4KlL9mrSUjvswRgMTZ4iVruTGG1LjaiwiKXJqeeoImaiMpQ
	 ltuGSO4yZip48/ANoh1ic2UB1BWo1LnW4PYktpwnXCU+5yjdZ14lo0kdxDiJQf/+VOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=caY7EDIS;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C5606A31F;
	Sun, 15 Nov 2026 08:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=caY7EDIS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Oa
	pX+iokibpyEzcdY1VjeGvIXarvH9elHqEwWQtq7J8=; b=caY7EDISTrE70gXwYf
	yeNh8IPsdUVutjEKgzBll+sA4KjIJ8l6rmHsj7PpadaH8aZLYRfAGUHGPT6aMyAq
	oHcYf6oRUWrFdU/bcvIxNUuoDaia0X1DTnANS4D5kY/Rra33KLACykI0Waq6NgBP
	wzUVVxH+O2ZKtIAgIaZGxxYRU=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3v4f8ZvlqxKXvHg--.43707S2;
	Sun, 15 Nov 2026 16:02:06 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] hwmon: Fix sensor_device_attribute{,_2} type confusion
Date: Sun, 15 Nov 2026 16:02:00 +0800
Message-ID: <20261115080203.910033-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:_____wD3v4f8ZvlqxKXvHg--.43707S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4fXFWrKFyUZFyDuFW3KFg_yoW8Cr4UpF
	WkKrWFyw1kJFZ7ury7uay2ga45Kr4kJa4UJryDt34SvFyUX34jgrZ8tayjv343Cr4rGa4F
	qryUWry7Wa98Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqksgUUUUU=
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7h7xQmr5Zv6hVQAA38

These are the same kind of bug as the one fixed for nct6683 in commit
c4a01c2a80b2 ("hwmon: (nct6683) Fix incorrect struct cast in show_pwm()
and store_pwm()"): a sysfs callback downcasts its attribute to the
other variant of struct sensor_device_attribute{,_2}.

Both structs start with struct device_attribute, so container_of()
gives the right base address, but the index field is an int in one and
a u8 in the other. On little-endian machines the low byte happens to
be the same, which is why this has gone unnoticed. On big-endian
machines:

  - nct6775 (_1 attribute read as _2): every *_beep write lands on
    channel 0.
  - w83791d, w83792d (_2 attribute read as _1): temp1_max and
    temp1_max_hyst index data->temp1[] with index << 24, i.e. 16 MiB
    and 32 MiB out of bounds.

The w83791d and w83792d effect was observed on an s390x QEMU guest
(v7.3.1) with each driver probed against an emulated I2C chip:
temp1_max and temp1_max_hyst read 0 instead of the values in the chip
registers. The nct6775 platform driver cannot be built on s390x (no
HAS_IOPORT), so that one is based on code inspection only.

The three patches are independent of each other.

All three were found by LLM-assisted static analysis. The changelogs
and this cover letter were drafted with an AI assistant from my
analysis; I have reviewed the code, the fixes and the text.

Ziheng Wei (3):
  hwmon: (nct6775) Fix incorrect struct cast in beep callbacks
  hwmon: (w83791d) Fix incorrect struct cast in show_temp1() and
    store_temp1()
  hwmon: (w83792d) Fix incorrect struct cast in show_temp1() and
    store_temp1()

 drivers/hwmon/nct6775-core.c | 4 ++--
 drivers/hwmon/w83791d.c      | 4 ++--
 drivers/hwmon/w83792d.c      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

