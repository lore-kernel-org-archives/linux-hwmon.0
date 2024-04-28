Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F371A79E1
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 06:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714284265; cv=none; b=NbN8M/1jZ4ueZ4tDU5YU9eU4v0LYOJwHJpoLWZi76u1JcqeAgC5frl4nOyUg45P8aqHjPfXHXF8zP9n1PrA/hQucT9kS2vWhFkPNTOqTpGL3z15V2z4ENcTzZUqnLc6ZVcHNaJxsO+d4YHAYSQS8GQDDBCM42Vnlyi6rLAnuCbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714284265; c=relaxed/simple;
	bh=VDNcYXFsa1PJfLY9jW0o3ikphR59TpS69PdRBelYnd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SAHtcZdj68TlnUeywqdHAXMrbKA3qahlTAX2sjCTmhVNoYEwkgpjj4I8k1/+TZwbI8ccDxsTqFjBDHIMGvaHcQ39dvzhVJEliYFdy9FAmcwQQGlqQ10C/l2ibdb1xIxFt+GBWL5H/kuKcahIVXNi7QpFGvkiGV4GaDHBGTBNDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=ozXUmblg; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="ozXUmblg"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43S63jsx3523223
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 28 Apr 2024 16:03:55 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43S63jsx3523223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714284236; bh=U/ekxJDaAh7rWWmyDlqch6OsY6V0JlYlMab3c/X6lBo=;
	h=From:To:Cc:Subject:Date:From;
	b=ozXUmblgLUvJjamOWDWHYxDGBXF5Qhw5gk2Q5dyK1AawDht2lfd6xOqU53Q4SNpEY
	 pl5sG+u1oVFF0qhr+mZ7ibokefWU2a0Xy2ewd9lgbpymlmhTKWaXhyNGHgv4JQvI0f
	 DvyzM67jQvO7oyHBxran0je6frtJY7Q8b+wAce9swRELS9rRL8LwJzC/LUAYTUMXFK
	 AlCv13m6jLq0vHb6bMJ/OSQhvsblUWFIFgV2n29Wh5f+gNIQtWsVlOycFra76iaZA+
	 y7bLDu6U0kXKIruzbIvwn7DniICqoplaaEjnpOm+7E15jGe8YkeCHnKh+1FjCjMawB
	 14CvMCCL6vecA==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 0/4] hwmon (it87): Correct handling for configuration mode
Date: Sun, 28 Apr 2024 16:03:25 +1000
Message-ID: <20240428060343.2424176-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 28 Apr 2024 16:03:56 +1000 (AEST)
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

Changes since v1:
 * renamed the feature to FEAT_NOCONF and macro to has_noconf.
 * reworked patch descriptions to be more explicit about the actions and
   remove any reference to the BIOS.

Changes since v2:
 * rename variable from opened to enabled it87_find().
 * corrected final call to superio_exit() in it87_find().
 * minor update to patch documentation for it87_find() change.

Frank Crawford (4):
  Rename FEAT_CONF_NOEXIT to FEAT_NOCONF as more descriptive of requirement
  Do not enter configuration mode for some chiptypes
  Test for chipset before entering configuration mode
  Remove tests nolonger required

 drivers/hwmon/it87.c | 127 +++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 66 deletions(-)

-- 
2.44.0

