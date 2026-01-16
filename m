Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC51E5207
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600776; cv=none; b=O7kAS79DJdebCs6Mac7On4zoeBn2E07JL2Sq3s7+NuQfsb2ZjnhGEbUuaepwz/PKhiTTtBdHfnZuZFRrrOGElA8wEWGjHuBGENl7NfU9I20zVxaudJXhr2rtE2mA/hD3Ljbn4nYq9+1GsfsTQh+Fl6Mdmd+RGsyYtGtCX3vfalo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600776; c=relaxed/simple;
	bh=fIrcfoFq2M1CgW0fF6qpSCG5GTOFgmdNMDsx4mmOXsI=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=YQ8CkAadF6iHQR4ZAlch8YoqWwa8A/+ivhA2pSoCKueLtwkAoBWRQXkph5Umt8vbbscrvEddfkO8N6R0VhfT7Jp7XIG3iCWUz4/eZgaaYYr//SFCekSwuh+1K7r9PuP4IxQZbCyORd/ySAvJtDoe1W9C4HKg6WkrjxWNJF2HvLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=biorez.de; spf=pass smtp.mailfrom=biorez.de; dkim=pass (2048-bit key) header.d=biorez.de header.i=@biorez.de header.b=AmpALWqn; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=biorez.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biorez.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biorez.de header.i=@biorez.de header.b="AmpALWqn"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4dtD8y3tf3z87Ln
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 22:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biorez.de; s=key2;
	t=1768600338; bh=fIrcfoFq2M1CgW0fF6qpSCG5GTOFgmdNMDsx4mmOXsI=;
	h=Date:From:To:Subject:From;
	b=AmpALWqnrJZJhAYnvtZeqA2RHJqUg112/4uIZsSokgWkH84i1R4OPGQvIbUySvKxv
	 Rh0WgyAGWUx40V5Ve5tmO0zvoSuhKWHy1YRDUJ4+w45on+Q2xaZyYY2M93ND6Usved
	 glZlPtQqw5sZieLsAPopv40CoaW+0GHP7Oy+GQzp9HMJQS1LbzmumIwIdXlmnFkSMB
	 crv9pQtAEhpGADY+Wpz+VTc91+TsiQ+cCUpxYalxYjMRLYxuOUSYNL+b205ojmMiVJ
	 0BrB+yYbi+4sNHLDv7GSXK9yUP4DTpQZtBjZ7P/XwGUp0BLeH10b9vTU/HzN9oA4Ax
	 trsdUys3oQAjw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4dtD8y3Th2z87JV
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 22:52:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mx2ecc.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4dtD8x6m1cz8tXb
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 22:52:17 +0100 (CET)
Received: from webmail01.netcup.net (unknown [46.38.249.153])
	by mx2ecc.netcup.net (Postfix) with ESMTPA id 654581A1C41
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 22:52:16 +0100 (CET)
Authentication-Results: mx2ecc;
        spf=pass (sender IP is 46.38.249.153) smtp.mailfrom=tech@biorez.de smtp.helo=webmail01.netcup.net
Received-SPF: pass (mx2ecc: connection is authenticated)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 16 Jan 2026 22:52:15 +0100
From: tech@biorez.de
To: linux-hwmon@vger.kernel.org
Subject: hwmon: nct6683 ASRock B850 (customer ID 0x164a) PWM write blocked
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <b1a782b4731c1e04b49cd3173340cdd0@biorez.de>
X-Sender: tech@biorez.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <176860033653.3562420.2524981557699968901@mx2ecc.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 654581A1C41
X-NC-CID: Ow9dH7JdTTqJvBO0ZWDttKE4od6vCvdHJnEGyDxA

Hello hwmon maintainers,

I'm testing the nct6683 hwmon driver on an ASRock B850 LiveMixer WiFi 
board and ran into a limitation regarding PWM fan control.

Hardware details:
- Board: ASRock B850 LiveMixer WiFi
- Super I/O: Nuvoton NCT6686D
- Customer ID: 0x164a
- BIOS: ASRock 5.35
- EC firmware: 1.0 (build 10/29/24)
- Kernel: 6.18.5 (Fedora 43)

The driver detects the chip correctly and exposes temperatures, 
voltages, and fan RPMs. The nct6686 device shows up under 
/sys/class/hwmon/ and pwm1-pwm6 nodes are present, but all pwm entries 
are read-only (0444), so fan control is not possible.

Relevant dmesg output includes:
Enabling support for unknown customer ID 0x164a
NCT6686D EC firmware version 1.0 build 10/29/24

 From looking at the driver, this seems to be expected behaviour for 
unrecognized customer IDs. I wanted to ask whether customer ID 0x164a 
(ASRock B850 LiveMixer WiFi) could be enabled for PWM write access.

I'm happy to test patches or provide additional information if needed.

Thanks,
Biorez
