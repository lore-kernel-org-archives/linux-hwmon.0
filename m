Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBE837A844;
	Sat, 17 Oct 2026 01:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201114; cv=none; b=YzecYn2TniYB0TjJgBORby+jCNiK5Vb2TlcRgT1lNHBZPxjZLMwzq9+B8dgXhetpxsFP8sho6QueAzRvTxxkuAKgulE90XqkjgMeL+HKKC6PdtZ4eWLP/h6rwGid8JwZnsW9weajL/E4wbxaF9miImdfqiVXHeOjt6SSr9CyKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201114; c=relaxed/simple;
	bh=nhxZw5A5qxAznYentzn20vtaOKditdgoWk5VJ9PoAys=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C0GLX+MvI/vR9bd9OqoDLU+h+t46UF1G/LZysOET9yXkYEj5GpnnJd3r18zPZWijfcs81rQA09iTKtCUSZFGTZfxTA08JJ1votDlLKe4XRwc6PIEvjID7J4byR+9Ej58DHoJRLrmxzRwY85ttEYx6jPTFyPJWgeQNoRnQjqLR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=OZsltyiK; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OZsltyiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792201107; bh=nhxZw5A5qxAznYentzn20vtaOKditdgoWk5VJ9PoAys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OZsltyiK3OFWrT/JuNoHPz81TwTZquA5szRnYm7PP7ymS0WoWQ3DYBo1oii0kD2T3
	 JbzF+76bohzX/TX0O8Qiwy5H+0PBZrehrckbHM5S9LWQT2FE4Y2AAFRCYR1A+cFXNG
	 4uJqWDY4sweBM3lSEMaVAsk2qDxFcyIJB65OEHww=
Received: from [192.168.30.1] ([2408:8452:a80:146f:11d2:bd8e:de50:4c99])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 996326FE; Sat, 17 Oct 2026 09:38:22 +0800
X-QQ-mid: xmsmtpt1792201102tgjl4kcjs
Message-ID: <tencent_3A4DA800AA0FC8C76CB748048FFA0DCC210A@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoe4GWJEEkHbDNRxtytg3T4/qnjYXQGpxmzvdSV8fR0iIqAJNk05R
	 NBDUYebg4+pX4+QtSE7tEksDEDVyCIyLsUhQafCyOgDLOVx9Mpkz1zV8xK+Vbrj7yOlOfxO6PALF
	 sDVyF7FLeA6/XQjWl/VI+tZMQIEZLE5TXLn0h5PYjMpMj9KJDX/GLFOR1zLyrD3qowsisFspauym
	 ZafcTSx3LnoqevCvJQmgztoGz9f62wXcFSUP/xvslQAvezOXB/IOSkLFfoo/KEAAbE00CgcBIBXq
	 PDaPY7N/cC4fL98K2g5mmCH/cquNMTQHVvosfkhgMqwP1idvyKh+fcAeZHjLNFSSz/2CMQ5NqnOQ
	 rRGuUa1a2fBGH06DccJfCYgc0wAwzhVB87zPVMZ7CGoqft8t+wIDrhMnElTignoMXvl+kNVOp3gG
	 lM7YesLon1I+FokY7NlaIAORW+f9wUmgak126uhbaNqEbnhBB26egysx6e3iT6E/AKwLd4AENOeu
	 Ah64ERWMTXeosycWzW4Jcl7i1vZM5PTPczDCW6/BfJduuB9TdTie0bqxO3veC+8P9PowvOO4chRZ
	 NLa+Rr2mxuDXTe+aQ+jxyqA6XUHFDKdKtdipQOsaY1HMLH7sE/DtggvLcxJ89F7FNoV0xzRjXiB1
	 oqEc124sjmHEC3Df2k12/7OdF6dzvV0T5fhtW2SE3zYc/wAaZJqTD1h33fapiMvfQWZakvUwHMrn
	 0BG9CAE8ZMEnswAMtgkI+ye9w13ymHWXjtrTnKCGlOKoINuslxWOYWFTbWTaMTJHk3cc5bcqI0Nr
	 vZncxITlDDjRu+7O5Z7dACVgUICLUlTTcwsHCeAeSVD1szC4WpS0SkcD247NPznkWr0nG6PpQPBO
	 DPgPKKaI+c5HTkfWdmjUz+EOiQnO5g73HHxd/26L8LHdwhb/16OJgtRYy/t914P325zcy9PTDbcD
	 0V152SJQLNbVunk/rymBPAFagGIIoDAvckzl7dX60UuTVvZ/5qc98EiG7RQpSLitBPkXGex2rW5Z
	 fQMLI2qifsnOFjyPD2
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: skxby <2374604267@qq.com>
To: Donjuanplatinum <donplat@barrensea.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject:
 Re: [PATCH 0/2] rust: hwmon: rework hwmon abstractions, add TMP108 driver
Date: Sat, 17 Oct 2026 09:38:20 +0800
X-OQ-MSGID: <179220110051.19044.14406267695678410421@qq.com>
In-Reply-To: <818d5dd7-4b8f-488d-ad99-3ce114027262@roeck-us.net>
References: <20260512155747.10136-1-donplat@barrensea.org>
 <9c2fa543-525a-4e43-9f73-7caf13b98039@roeck-us.net>
 <tencent_576573331343805F032731492D63C12D7E08@qq.com>
 <87se26dpzf.fsf@barrensea.org>
 <179214016501.15268.642738678844764524@qq.com>
 <121A8A5C-E782-4959-B1EF-F6F09E5842D5@barrensea.org>
 <818d5dd7-4b8f-488d-ad99-3ce114027262@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Donjuanplatinum, hi Guenter,

An apology first: the AI-written reply in this thread was sent without my
review. That was a mistake, and I am sorry. Nothing further goes out from
here without going through me first.

Your "?" was about the "<SENDER NAME>" line at the end of our cover letter.
That was a placeholder in our sending template that should have been
replaced before posting -- there is nothing hidden behind it.

Guenter, on runtime testing: every patch in this series was built and run.
The lifecycle stress tests (100x load/unload cycles), a 22-case sysfs
regression, and extreme-value writes were part of the work from the start;
they are how the chip_config terminator and the i2c client leak on the
registration error path were pinned down, and they were used to reproduce
and verify every fix. The defects the review raised that the tests had not
caught were handled the same way: reproduce first, then fix, then re-run.

v2 is being finalized: it addresses all review findings, will Cc
rust-for-linux, and carries an "Assisted-by: LLM" tag per
Documentation/process/coding-assistants.html.

Before posting it: are the two of you still willing to take a look? If the
answer is no, I would rather hear that now.

skxby

