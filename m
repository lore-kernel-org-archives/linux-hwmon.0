Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F753F0ABE;
	Fri, 15 May 2026 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832601; cv=none; b=K05LCpiNA8U1nRMVyFI/j00K2f0EwQgn3X93kcx3PqYeHd21bXEWrEJqP5fD2HlyDsz09FlfaJ3H8IR8bij3y10JOZGidLYrAysXqenEXs2yu4Xkzs6g5to1YXAZ4o05q1TU9YVHf+2PMzIT602TUrBaEE17iGtaUyBvCbw2v0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832601; c=relaxed/simple;
	bh=HXevtQEQ+RqsIpAAfI6MMSxM6qkfSnzz17m3dJ7nZI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKt/qNOugCExBF2X1+gG4SThRLi3ZUpIgrfnhpt0KjPbHBmUrYVMFn51yTahowcNDhmTpAGnUD1YWVbgRz6cwg4AmQ+YGOpmWa+uzUmyVhoLLfrYA6Lc414tZp8t9ZJ5bg3xGI8ZbUWboEsimRI6tiYimBCJzLJb0Mv5pIkGFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GpwLAJCG; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GpwLAJCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=yMYFQ3HfKARwXP6ADff9ztpQMHVRNylbm0LSYCOqZcY=;
	b=GpwLAJCGXlAbggXlVYPsnd/MMhxsgbkDXd1E9CUUPZPhQaMZminFjHT/u+UJhI
	mW6kV+6/iFkR2tMudTr2wQn956GB32uWvwV1WG0ysUK/b6/mabR17BXxZv3+YdFF
	fQqKrjhW25cha1nbKTjGioYFhBtW6iVNg3YdUA0hI4TWo=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD311641AZqM7DFBQ--.58569S2;
	Fri, 15 May 2026 16:09:29 +0800 (CST)
From: Kean <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean <rh_king@163.com>
Subject: Re: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer dereference when DMI match fails
Date: Fri, 15 May 2026 16:10:08 +0800
Message-ID: <20260515081010.32812-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <c808d5bf-b166-432d-864e-db0536a3f4e3@roeck-us.net>
References: <c808d5bf-b166-432d-864e-db0536a3f4e3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD311641AZqM7DFBQ--.58569S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyDGry8ZFyUAw4rGw13CFg_yoW8GF13pa
	93Xw43trWUCw1kJrn7Cw4UZrWrAw4ftayDWF1rJw1DA3s8Gr4SqrySqa1Y9a4DuFs3Wa15
	ta1DCFsxXa15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUpT5PUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC4Bp-LmoG1Lr9JQAA3x

Hi Guenter,
Thank you for the review and for pointing this out!

You're absolutely right. I realize now that my patch was overly
cautious — in normal operation dmi_first_match() can never return
NULL here because lenovo_ec_init() already guards the probe behind:

	static int __init lenovo_ec_init(void)
	{
		if (!dmi_check_system(thinkstation_dmi_table))
			return -ENODEV;
		...
	}

That said, I tend to follow a defensive programming style — checking
for errors and returning early whenever something looks even slightly
unexpected. This is exactly what lenovo_ec_init() itself does with
dmi_check_system(), and it's also why we often put a return (or break)
in the default branch of a switch statement. So I added the NULL check
for dmi_first_match() as an extra sanity guard, even though logically
it should never trigger.

I should have made this clearer in the commit message. The patch was
meant as a defensive sanity check, but my description made it sound
like an actual reachable bug, which it isn't. That's my mistake.

I'm happy to drop this patch from the series if you'd prefer. Please
let me know how you'd like me to proceed.

For other parts and the format issues is my mistake that missed the 
--strict to check the patches file, I will send the V2 version, hope
 get your review, any problem you can tell me, I will feedback and 
tested as your requested.

Thanks,
Kean

