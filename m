Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [203.132.92.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CCE1C0DF8
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Apr 2024 03:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.132.92.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711940485; cv=none; b=Kzl6xLUqqr52jYldVXV1E6Yz33Kb9ENqfNPjl4EXOKDpT95TTTVy2oO7s88QlAdDNAXmlfGzNE6ULcTVbcxS5fKrb+h+YM4hMZvnNLrgKTtYkYNnOI0p1plqSB5Kyc2dznqu9MKnecRQjD2PB3vRXyaiA/qkDaN3sUK3x0lMu60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711940485; c=relaxed/simple;
	bh=F4Nltxd64i4uHYYrV8J7hU3zw/Dsx1oJpEvtgfIIKJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJ9iBbIeP3y/7B9Yc0dzwIqQnK3qoMlgZ6S260wN1qI1GJ1cHXt8/5DJtz7MRM3Ue6prfO7uzw0N/AlcgxhbMX1iyKiQZl7MQz2Hpac93bqLvbZ44GT+plNmvGr8O2l/Ga7QoQlhCyGUBAjMzrMafc1yGfrjEK+rE08Keza37kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=m3cpJJbI; arc=none smtp.client-ip=203.132.92.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="m3cpJJbI"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 4312uQwj871729
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 1 Apr 2024 13:56:34 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 4312uQwj871729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1711940195; bh=6QavR8+N77TdckjkRh57p8WJzWa5e4yYlJTT3cx8wcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=m3cpJJbI2364CBBL5exgCq1H66yB1JAq2hsclW46RB8zTk8EM73JCXGGYDUwPxp8V
	 Sgz5EVTK931jSkZMDLrVOP3sdWerIZdZLfDlymy53vrygfZI64FMuT+GG9S+sLgrk8
	 qcRwVApwxCWgV97uacHN44qKOHB8/kZywcto2wz1pHL3TV8qs6ky2EPS+0ljOfmUyZ
	 s8kstSBFLQDgPhapWQa/c3iAnR4Q1Is7l0NvlmEl2SntnAAeqNpfRF4YQ18zN1u/Hj
	 pm5Om1w7Ru6AAFbU3g37jSyOURkuOib7rR7lbbmEOV6KFhPk3UQ+IPcFtUkvHlVO0r
	 MwfFnrY/HubRw==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 0/4] hwmon (it87): Correct handling for configuration mode
Date: Mon,  1 Apr 2024 13:56:02 +1100
Message-ID: <20240401025620.205068-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 01 Apr 2024 13:56:35 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
X-Spam-Level: *

On various Gigabyte boards, incorrectly entering configuration mode
causes the second Super-IO chip generate LPC buss access errors.
This was preivously fixed by ensuring that the second chip receives the
code to enter configuration mode before the first chip.

On discussion with people who have access to the specification documents
it was noted that this is wrong, and you should not enter or leave
configuration mode for the second chip, as it is enable by the BIOS and
should not be changed.

In particular, this was found to be the case on the Gigabyte X670E Aorus
Master board, where it was reporting a totally wrong chip ID (0x8883)
using the previous method.  This was corrected by not entering
configuration mode, and this has been found to still work with older boards.

---
Frank Crawford (4):
  Rename NOEXIT to BIOSOPEN as more descriptive of requirement
  Do not enter configuration mode for some chip types
  Test for chipset before entering configuration mode
  Remove tests no longer required

 drivers/hwmon/it87.c | 127 +++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 66 deletions(-)

-- 
2.44.0

