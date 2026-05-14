Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925302F12AB
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737610; cv=none; b=TQKJWKomGaKmz5bruAqMRqeJFVCAhvtr1KzlpqafhwKz820cQD72wpJP8khOpYWUhSkFLSlhsQWnc8gWuaWhMaRuppu6i7VXc+cHi2Xehh0e2mZTAlpFb+95t4UUo75lIxceDtrU+090UgYsUNIVpLlPjnAqPJkFMGGRg8xD+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737610; c=relaxed/simple;
	bh=62BBT7PJUHt/3ToUXc4d7+Cv4tQFEhtaTnVsMMcoqoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NL23BpesVdo/VIpLnll5/X3NM1VQ/Ovj8kf4RppwMEbDR05N0mhAgqiS8Bk8vCpz2hYorEUuOUJ4yGIi1PgQsGQS4R0cRnW+ue6oK3w3AlyN5sEd071ZAWW4Rp9n5FmiDUB2AvsuQ1JiJMFww5UeQYmDkUfVEOWq7RkDgdhb9EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daZD/Wi7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daZD/Wi7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E1EC2BCB7;
	Thu, 14 May 2026 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778737610;
	bh=62BBT7PJUHt/3ToUXc4d7+Cv4tQFEhtaTnVsMMcoqoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=daZD/Wi7eQBLTduvkMEwzeM/2e/XWWqJfZCIWWphb2rkHSo/ifyzbpjOB92LO7S8r
	 d624ot6MtSlyqUOUoeZE/CaBV9TIVo0/Fa7ZhKIiUX9vvoimgYfHCCn9J/1DjDl3Ye
	 9cpFstCfcBEBlLLOHVBu1blOhq9/H/+sZwriCBf49iqkUAtBdNgRWZxeSGc525jihO
	 NMQZyUOL3J2VqctViUDbZwqVhCcrJ+m6Bk4+i0rZpQuexHxqDFoQfkIMSepRfgGHsK
	 YVqV+H3O+VUzQ2vA+SYq6AoOKXnaFLdzQ0uzcEQGwcjSiAlPLP1VLVtMkFytSMEuSL
	 vkWp5AC/YbaDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] hwmon: Support guard() and scoped_guard for
 subsystem locks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513142514.419345-2-linux@roeck-us.net>
References: <20260513142514.419345-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:46:49 +0000
Message-Id: <20260514054650.17E1EC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The header include/linux/hwmon.h uses the DEFINE_GUARD macro but fa=
ils to explicitly include <linux/cleanup.h>.
--

commit 14ebb15eae07a29dd197db88caa15eb8cc2e93a1
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: Support guard() and scoped_guard for subsystem locks
   =20
This commit adds support for guard() and scoped_guard() macros to the
hwmon subsystem lock, aiming to simplify lock management.

> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 301a83afbd663..04959e044fd0f 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
[ ... ]
> @@ -495,6 +495,8 @@ char *devm_hwmon_sanitize_name(struct device *dev, co=
nst char *name);
>  void hwmon_lock(struct device *dev);
>  void hwmon_unlock(struct device *dev);
> =20
> +DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_=
T))

Does this header need to include <linux/cleanup.h>?

The DEFINE_GUARD macro is provided by <linux/cleanup.h>. While many files
might implicitly pull it in through <linux/device.h> or <linux/mutex.h>,
could this introduce a build regression for any compilation units that incl=
ude
<linux/hwmon.h> without an implicit include path to <linux/cleanup.h>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513142514.4193=
45-1-linux@roeck-us.net?part=3D1
