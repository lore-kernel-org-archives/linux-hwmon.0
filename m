Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [144.76.133.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F16034A797;
	Thu, 24 Sep 2026 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236696; cv=none; b=EvTIo7+s1Au9lE6SafbpT1RGFehh/bTjzHLBNLslJWovRqG/0t1za1uJxkPUVWwGQjVRHnHF/Kh+dqJGXUJ84uQzaBNw3wqx7kYqwvAkdsGw8Ax13gM5VIUTxky1TILc+2c5+x1NHe9pBcVHs6I6zo12UeWTURGBd6YE3K2FW/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236696; c=relaxed/simple;
	bh=Oe3TBQoFeJwOEmW2IFZ/DorqgJWbBlcjliNIc74gLIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkTYESAqljIIJyuybfjMHAdXZO77wXWQZ2xPkACjJpyYKjTcEWWyq/Qwo2eu2M5bpPOEoDaQQwTwWjCd/wxp4kkSQamoRhVFIl8P5Eqwk+8kQwVgAYmfgyeUnrgAJY9ri80CBC3hlAAh/9dvwbO9ZYd6HQNQIjZSVNOq+AHZ3z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=144.76.133.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 9C4E9D55;
	Thu, 24 Sep 2026 09:58:08 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7905D609CDC9; Thu, 24 Sep 2026 09:58:08 +0200 (CEST)
Date: Thu, 24 Sep 2026 09:58:08 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Michal Szpakowski <michi.szpakowski@gmail.com>,
	Jordan Brough <jordan@brough.org>
Cc: linux-hwmon@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (applesmc) Expose the SMC battery charge limit
Message-ID: <arTYEAnYYyDFsmc4@wunner.de>
References: <20260923144117.295450-1-michi.szpakowski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923144117.295450-1-michi.szpakowski@gmail.com>

[+cc Jordan]

On Wed, Sep 23, 2026 at 04:41:17PM +0200, Michal Szpakowski wrote:
> Intel Macs keep a battery charge limit inside the SMC, in the key BCLM
> (one byte, percent). The SMC enforces it on its own: charging stops at
> the limit and the value survives reboots and operating systems, so the
> only thing an OS has to do is write it. On macOS the tool "bclm" does
> that; on Linux there has been no way, because applesmc exposes keys
> read-only through key_at_index.
> 
> Expose it as the standard charge_control_end_threshold property on the
> battery through a power supply extension, so UPower and the desktops
> that read that property pick it up without knowing anything about
> Apple. The battery of an Intel Mac is an ACPI Smart Battery handled by
> the sbs driver, which the ACPI battery hooks do not cover, so the
> supply is found by walking the registered supplies; should it register
> after applesmc, its first property-change notification attaches the
> extension. Nothing happens on machines whose SMC lacks the key. Writes
> are read back, because the SMC silently drops values it does not
> accept; 100 disables the cap.
> 
> Tested on a MacBookPro13,1 (2016, 13", no Touch Bar): with the limit at
> 80 and the charger attached, charging ran at a steady 1.55 A and stopped
> at 79% of charge_full with status "Full" and current 0, and the limit
> read back 80 after a reboot.

Jordan Brough is working on similar patches, perhaps you two can
work together to make sure there's no breakage on either of your
laptops an no conflict between your patches:

https://lore.kernel.org/r/20260918175052.85461-1-jordan@brough.org

Thanks,

Lukas
