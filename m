Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8220EEC0;
	Tue, 24 Dec 2024 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735022355; cv=none; b=YwuIKzDWjg/k01AQwufIC7iN5Ghi5UOSvG7Eu5P3SucxM11dlCLv04y2z7B2CamDdeh0rl/Zs4RuymFcpuZCtkaAqNm1rlA5+CTqLmobFedAaVY9oLY2trTG2FS/OJ7Kz3Gc69Cp5EDoqWM9xKw4CeKOZym/Bk+p9nqCFD8Lavg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735022355; c=relaxed/simple;
	bh=jbijRlkk1u3Myfbl4QxbYM8IaSrvrLYMd70P/GANDpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYgvia4+sENitSJfXVgfsOhGpmcPpKZh6x3cZzNjoZyDilUUk7Jh9jgxQJ7egMkq8K1IA4vcluJJR1HRngtqaEcKii7bcjOuR47vxkXjnyZzZoy9QWqLfCW/8LXAaCLwUJA3qBCm77l37JDypLjBtvDol9hHzGi98RXaFciKmJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=N8lLkpyi; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="N8lLkpyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=f5jlw
	Rk/xlJYF88R8GbhOo8Dy4182jz49B5ihifHcGs=; b=N8lLkpyietyBI14+MVhnD
	qITCLqljn21SHoRvlkzx7NT4IBZXa5wK5QbG3OUjflsIijObOwFJwTAw9evSlHYy
	EcknNYBonHr0ZoYs3YRmbzP+X76qCpeUBE+Lv5Y0cQui8e3z3p//RAcKX/o4HHBk
	S32G8f9I+CC7rbNlATspSk=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnT8tRVmpnWko3BQ--.38652S4;
	Tue, 24 Dec 2024 14:36:03 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	jdelvare@suse.com
Cc: Wenliang <wenliang202407@163.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] hwmon:(ina238)Add support for SQ52206
Date: Tue, 24 Dec 2024 14:35:56 +0800
Message-ID: <20241224063559.391061-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT8tRVmpnWko3BQ--.38652S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrWktr43uw4DZFykWw4rKrg_yoW5WrWxpr
	17Gr18GryUJr17Zw48Jr1UJrWUAr1UJryUur15Ar18uFyUJF18Jr17tr15Jr1UJF15Jw15
	Jr1UGr1UGr1UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREeHhUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNQm-02dqSyrWTgAAsk

From: Wenliang <wenliang202407@163.com>

Add support for Silergy i2c power monitor SQ52206 to the ina238
driver as those two are similar.

Signed-off-by: Wenliang <wenliang202407@163.com>
---

The manual content of the chip has not been fully disclosed yet. Can the manual be provided in the form of a cloud storage link for reviewing the driver code? If not, how can it be provided? It can be provided in V2.
This version patch is displayed through text, and both chips are power monitors with a 16 bit delta sigma ADC specifically designed for current sensing applications Operates from a 2.7-V to 5.5-V supply. Same pin definition.In addition, SQ52206 add detection for power peak, energy and charge.
The main differences between the two chips are as follows:
___________________________________
	    |  INA238  |  SQ52206  |
VBUS_LSB    |  3.125mV |   3.75mV  |
DIETEMP_LSB |  125 mC  | 7.8125 mC |
____________|__________|___________|
________________________________________________
reg address |     INA238    |     SQ52206       |
____________|_______________|___________________|
	0h  |     CONFIG    |     CONFIG        |
	1h  |   ADC_CONFIG  |    ADC_CONFIG     |
	2h  |   SHUNT_CAL   |    SHUNT_CAL      |
	3h  |       /       |SHUNT_TEMPCO(16bit)|
	4h  |     VSHUNT    |      VSHUNT       |
	5h  |      VBUS     |       VBUS        |
	6h  |     DIETEMP   |      DIETEMP      |
	7h  |     CURRENT   |      CURRENT      |
	8h  |      POWER    |       POWER       |
	9h  |       /       |    ENERGY(40bit)  |	
	Ah  |       /       |    CHARGE(40bit)  |
	Bh  |   DIAG_ALERT  |    DIAG_ALERT     |
	Ch  |      SOVL     |        SOVL       |
	Dh  |      SUVL     |        SUVL       |
	Eh  |      BOVL     |        BOVL       |
	Fh  |      BUVL     |        BUVL       |
	10h |  TEMP_LIMIT   |     TEMP_LIMIT    |
	11h |  PWR_LIMIT    |     PWR_LIMIT     |
	20h |               |   PWR_PEAK(24bit) |
	3Eh |MANUFACTURER_ID|        /          |
	3Fh |   DEVICE_ID   |        /          |
____________|_______________|___________________|
The ENERGY and CHARGE registers are 40 bit read-only registers used to display the values of energy and charge. PWR_PEAK register is 24 bit read-only registers.The CONFIG register has some differences:
__________________________________________________________________________
BIT |	    INA238               |                  SQ52206               |
____|____________________________|________________________________________|
 14 |  Reserved. Always reads 0  | reset ENERGY and CHARGE registers to 0 |
____|____________________________|________________________________________|
  4 |ADCRANGE 0h=163.84 1h=81.92 | (BIT4~3)ADCRANGE 2h/3h = 40.96,	  |
____|____________________________| 0h=163.84 1h=81.92                     |
  3 |  Reserved. Always reads 0  | 		  			  |
____|____________________________|________________________________________|


Wenliang (3):
  hwmon:(ina238)Add support for SQ52206
  hwmon:(ina238)Add new features for SQ52206
  dt-bindings:Add SQ52206 to ina2xx devicetree bindings

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   1 +
 Documentation/hwmon/ina238.rst                |  16 +
 drivers/hwmon/ina238.c                        | 286 ++++++++++++++----
 3 files changed, 240 insertions(+), 63 deletions(-)

-- 
2.43.0

