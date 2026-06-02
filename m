Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659A3C1418;
	Tue,  2 Jun 2026 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388922; cv=none; b=iYVx+OPMyrjArEAptLoRLgGRXwSONtQbZlBotpVHhYtK4ZNA6GgSw/Le9hzuo9+dRokKQGTmtjXNcI5bhmlaJOQQ9cbq8FfHoybOWwEynRZE58tLWvF5FAuViwln9PPf1vLlVKA2qbq2J95IbQpTy4D2vF/s48NAap/Yip7ISZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388922; c=relaxed/simple;
	bh=Uj9KutU6sAa4Rdu82VSOg+siLLJxEFx3TtD1sSYE7ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fa9m4LQMtl2/IKDyOLqljaakNiX2V8KmH5wuUHw4mJElWhiUWjp85sZJ3DXm8jOT4zsIECdVt4O3QW+AVEGsmhFRskU3SylW1RZ1Ovx1HJ2x9r6sZadxoggcsJzVN7ymy0q9bxytHUAC+Xd6BbuuGjC4wjq2h4jykPoixuh98/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=aeOQjbl/; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="aeOQjbl/"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gV3rJ0ykMz4997;
	Tue,  2 Jun 2026 10:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780388912;
	bh=Uj9KutU6sAa4Rdu82VSOg+siLLJxEFx3TtD1sSYE7ws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aeOQjbl/kPuVof/+vEN1obCZfcdWSfB0HDV32NOosMx6Pz4Br2dQW/dhAXb9qkAMr
	 ov84+JoA/XBH5IK1WkBndRGpL2yxqgu0/88VKeNsxY5FG0fE2R6qkrn/+b+COcdkbx
	 26ZX6FC7t/5TjcYZa7KHC3Sy/uG1RXGjg89U56u4uZY02c7I+uwZoMt8d31rb31xog
	 y+ngfiY98BNfk4MM/Dw9bwQ8AcnhbVOIRdza5h4ZHPu33m9IBfGZwLqmsI4rNa3qFA
	 8uKtiKEr1OvbaW4X6HG18pb4ttTebmdr9VfwP9h6ETTwaqYYfmCUxKYU8YeOId934E
	 cWlU2gr/XjjOA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gV3rJ0DBzz4979;
	Tue,  2 Jun 2026 10:28:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gV3rH1bMHz8tY2;
	Tue,  2 Jun 2026 10:28:31 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 70CA360345;
	Tue,  2 Jun 2026 10:28:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1aac3438-baf1-481b-bae9-c0df21539679@leemhuis.info>
Date: Tue, 2 Jun 2026 10:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kernel
To: James Seo <james@equiv.tech>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Linux Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, moravec@ukf.sk
References: <4fb7bbf1-466e-438c-a301-e118e7e2a225@leemhuis.info>
 <ah6O_CIALz137OU_@equiv.tech>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ah6O_CIALz137OU_@equiv.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178038891071.3785695.56695847040690603@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 70CA360345
X-NC-CID: R5kbYtoXgfFD5jMNYPRkak8A+gYPHnUu78uJY11xmRuTEuc34Tk=

On 6/2/26 10:06, James Seo wrote:
> 
> Thanks for your email. Unfortunately, I'm responsible for the hp-wmi-sensors
> driver, so I'm not the correct person to contact regarding the hp-wmi driver.
Ahh, sorry, I just looked for "HP WMI" in MAINTAINERS and it seemed I
was not focused enough and didn't read that there was more in that line.

Ciao, Thorsten
