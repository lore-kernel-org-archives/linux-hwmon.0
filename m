Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBC21B4F09;
	Fri, 16 Oct 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.12.121.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138296; cv=none; b=oO/ETT/kgho7LsppyRJeHo2I47y4LztBVN9LVZoKtyz1M2gjSNAAQ6AEzuh5j5jf1BdbmoalDUryT8LA08yGkgDslxCJxrlQmH1VkxO/3s4H390xXA4OzSbTkG0M8NIE6QAKM2l24NfZ9LxOa5+T33B9cV4cnHqhTkKyP2JxHUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138296; c=relaxed/simple;
	bh=MCkKHSaGBdytU5Qwz2h6sgKDZoOR/kw/Lnze+FCbto0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J+dOxLZSyeva0IODrq9X9HcW/IeNxGq4O+DqRbzCDSAc5spg/6mcYHxuxuMYfnisY+kY7HneEnaUkuJv2Dp8ooOeISsml2Ybh2hbxk7yTHmbr4x8Jrwme0hnQBg4wPhpcFhQtY+dbz1X+puKTbW6cmdeHFykCDsMpWUhCdk0aXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org; spf=pass smtp.mailfrom=barrensea.org; dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b=AqPi5aBs; arc=none smtp.client-ip=198.12.121.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b="AqPi5aBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1792138294;
	bh=MCkKHSaGBdytU5Qwz2h6sgKDZoOR/kw/Lnze+FCbto0=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=AqPi5aBseo2GeSmvhpHGq4t2t7X4zn69I8seby3W/rtrX2lPzAnZ0JzRg/i6Aw/5H
	 8zou/nvuPXf0cBXT2ysbJ5OKVgFdovz1P4MIxPXcfCU6Hlu7pQaiFVUI/ZoNhlHhn5
	 KPqv8uBczTPv1CfUt2lkMx7w6e3J9JEA/vUx4ytwv1cbWLgaJY9JEismBscNbugf56
	 HUGUDOp6G9haMYOU6cpm77rOMTXDEMnFGNJbcgJ9D5wW1Z4VQdb80mjdfHawxF8yvh
	 uGtg0df1uM79b4zlWgGDCzux831qftqbq4jabMJWQ4wVojULxyGBSGpAFf4vRCh6Y8
	 M+vnUK6iNuiIg==
From: Donjuanplatinum <donplat@barrensea.org>
To: skxby <2374604267@qq.com>
Cc: Guenter Roeck <linux@roeck-us.net>,  linux-hwmon@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: hwmon: rework hwmon abstractions, add TMP108
 driver
In-Reply-To: <tencent_576573331343805F032731492D63C12D7E08@qq.com> (skxby's
	message of "Fri, 16 Oct 2026 15:24:15 +0800")
References: <20260512155747.10136-1-donplat@barrensea.org>
	<9c2fa543-525a-4e43-9f73-7caf13b98039@roeck-us.net>
	<tencent_576573331343805F032731492D63C12D7E08@qq.com>
Date: Fri, 16 Oct 2026 16:11:32 +0800
Message-ID: <87se26dpzf.fsf@barrensea.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


1. Please clarify the extent of AI involvement with the guideliens:
https://docs.kernel.org/process/coding-assistants.html

2. Please Cc the Rust-for-Linux mailinglist.

> Thanks,
> <SENDER NAME>
3. ?  

4. Please use your legal name in the sign-off filed.

5. Given the outstanding maintainership question, it may be worth
establishing whether there is sufficient interest in maintaining and
extending this abstraction before proceeding further.

