Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91631E107;
	Fri, 19 Jun 2026 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781836541; cv=none; b=gHvyO0OnXCdUlyZtPyZnkFNMHtgMqqPUZpbJ7oPnZAVVqZohu9sxm0nxGduxeCW2j0FJpm2ytqHvSPOqVdaZIPWNHZJhb5BgwU99oBDtPi6fniS+XLu4ImC0roAh8vOzk+v5i3WU3yDgxJF06X/wZFY4PwAPmcYfeKdrBbq+aSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781836541; c=relaxed/simple;
	bh=ZGVLPwObCgP20uwMKRFB7Ql5vZia8ZWLTp5UfaMt9fM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pHyXv43yyEnWYKr3nLOfRr/xMvHdDkIhnYKd5exZH37MetlQChrwlalJhKLSY4Xr4G1F4IeZDjEOeQrp1h0IM8woqf0XoEak7BBXw5tYvtcqlEywjJpxEdup3I7GXtyTW9+4AJCShqPzLCXltq98yuCUZpGbDcpaTJaK3K5yGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=NRRwoT6O; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="NRRwoT6O"
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42fc1acc2;
	Fri, 19 Jun 2026 10:30:22 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Question: OCC sensor_length validation in poll response parser
Date: Fri, 19 Jun 2026 10:30:19 +0800
Message-Id: <20260619023019.1064970-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eddb710cf03a1kunm4e1f4613ba788
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTRlIVkgeTBpJGB9DHRlPTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NRRwoT6OIADw1VHwrsOJCEPPKbN/hQjvmFhCPYnBu/dL37q3PlMRc+IopTYrMUDWmu3eCbFURxCDC7XEsqUZsLHAbjP0KOAsedFJkicJTEuEStI4CQ/QqulN64lnoSGKVvIH+gbmw+lWPKcJXfma/gnZQf79PiTPkDP93/ULGyU=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=RcBLat0XaZdU4hGS7ecNspeuwHYIBNlgVMZiOGIxL1g=;
	h=date:mime-version:subject:message-id:from;

Hi,

While doing follow-up review of the OCC hwmon response parser, I noticed
that occ_parse_poll_response() uses the firmware-provided sensor_length to
advance between sensor data blocks, but the later hwmon show callbacks
cast the saved sensor data pointer to fixed C structs such as
struct temp_sensor_10, struct power_sensor_a0, and struct caps_sensor_3.

That raises two questions before I send a patch.

First, should occ_parse_poll_response() check that the next sensor data
block header is still inside the response buffer before reading
block->header?  Today the loop advances to the next block and reads
block->header.num_sensors and block->header.sensor_length before checking
the accumulated size.

Second, is sensor_length expected to match exactly the record size used by
the driver for each known sensor type/version, or can OCC firmware report a
larger record length with reserved or future fields?  The show callbacks
currently index the data as fixed C structs, so a shorter sensor_length
looks unsafe, but I am not sure whether rejecting non-exact lengths would be
too strict for existing firmware.

The local fix I am considering is either:

  1. a narrow bounds fix that only validates the next block header and whole
     block before accepting the block; or

  2. a stricter fix that also rejects known type/version pairs whose
     sensor_length does not match the struct size used by the corresponding
     show callback.

Do you prefer the narrow parser-bounds fix first, or is strict
sensor_length validation also acceptable for OCC responses?

Thanks,
Runyu
