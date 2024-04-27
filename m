Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35183D387
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714207739; cv=none; b=eULHUagQUu/QokAsgUQHY+KGYvR2M1xEAFR7Ilp23vLcA8ww6GmmyP6B9nhTpixpRuTP8oo9gQWjgu+6S1vlgeT9U64IjDbdeSA35Hdz/TGrY8F2s8tQ7TTKVRnB1WXuZWUBQCp5j6yJv9sq9UzfBDgPiIxdcruA7sqHkKTfVLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714207739; c=relaxed/simple;
	bh=HDpbmuawMPr+9MK+RGC/96ono0q8AW9RYX7E+Cc15Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6PdOfddoTfniqmW86bDj7mq2CptgdcB35HpFAFa/zndJt8KAdHovHnUqWU3CuoaRbBkL/w+tiHnsCh71y/iAS4psATny+6/HMtWeeElojfYHyC/xzUyJHzW8wfvT0Hl9qJYA7D9zkYTDscIY/gr4KtulZkz7viQ+LDn+l1I+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=sB51+icl; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="sB51+icl"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43R8XNSC3013858
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 27 Apr 2024 18:33:33 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43R8XNSC3013858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714206813; bh=+/NAdaD4yciRt67m6fox7+wteqOQf/BYSsxHKL4OIlA=;
	h=From:To:Cc:Subject:Date:From;
	b=sB51+iclDCGppXbpDsVMsW7xM5BumqwRmmCGu2VPbm8IKRaUhOc8k9fKFtv4wx5an
	 c3EMsDFvbhaquZRQ6lx6m3Qe85Hhkq51Y5ncw8lqjf5tpvc6JZkM3ztCn+KGA+RK9p
	 nCfIJs6RIoAM/slpkV/oD8l2AQbopuiBjl5sBA5T1vwRkb0SlYithSFUzwAnVw6Eky
	 /hS/AUucP3UGKaqvwYAq0B6hFORJXBArn9PC09zipIXBbo4+BAWZG0kgOAEibjiJ+7
	 C0Xcn6dzshWrSV/sQhcjl6RC2n5eRSjroKlVHdhHkHl2AqyCPl+QgaC101Q+MIv9sk
	 fkgq7bMlwAAPQ==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 0/4] hwmon (it87): Correct handling for configuration mode
Date: Sat, 27 Apr 2024 18:33:01 +1000
Message-ID: <20240427083317.2077175-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 27 Apr 2024 18:33:33 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

On various Gigabyte boards, incorrectly entering configuration mode
causes the second Super-IO chip to generate LPC bus access errors.
This was preivously fixed by ensuring that the second chip receives the
code to enter configuration mode before the first chip.

On discussion with people who have access to the specification documents
it was noted that this is wrong, and you should not enter or leave
configuration mode for the second chip, as it is enable during
initialisation and should not be changed.

In particular, this was found to be the case on the Gigabyte X670E Aorus
Master board, where it was reporting a totally wrong chip ID (0x8883)
using the previous method.  This was corrected by not entering
configuration mode, and this has been found to still work with older boards.

---
Frank Crawford (4):
  Rename FEAT_CONF_NOEXIT to FEAT_NOCONF as more descriptive of requirement
  Do not enter configuration mode for some chiptypes
  Test for chipset before entering configuration mode
  Remove tests nolonger required

 drivers/hwmon/it87.c | 127 +++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 66 deletions(-)

-- 
2.44.0

