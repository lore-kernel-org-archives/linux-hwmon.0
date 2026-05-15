Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15802282F1B
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778887244; cv=none; b=l4rjrPZd3X1U4AgcXjBMLwUzcvc2YNoPhv6uP4gQPI7R3dHMkrSRvA6efpeKEaTvkNrOXk01r2CaYvynQxyvJ8kTW8ZaJ8bc7WqwhONA9DVVTFGsJ4lx5MK4x+N47IqCXfuFEUfanz6w5EDxV8qT2rHlvewIzybTJBcejleY3dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778887244; c=relaxed/simple;
	bh=VgK0Eu++iXvwi1OkXCdNB/jFh0RGv3x3g3iPl6W2MOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KqUBM2xueG7JQATGDxdp5usKEPk0c1c2krgAVILro5MUwgxu5EA0VdYxvvLMN0978FXGdQu+al2+OLYEU0ba8oeug7nW9xbtA44AuKW8wgr3t844k+yWRtxrW8t/oSFyOSqrO6CA4MYO1R3v/A0LcbWwmXBytPaqgT7DBqG6A1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMTcQEGO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMTcQEGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2D7C2BCB0;
	Fri, 15 May 2026 23:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778887243;
	bh=VgK0Eu++iXvwi1OkXCdNB/jFh0RGv3x3g3iPl6W2MOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LMTcQEGOT5Tjn70/fFukhmmKqBOuoSEuW3RELUiWWQzPG9D8D1+AkbEuwpTCZ8uvW
	 eTswhCgHvCIEYb0q2Nnv1xyXVbWs6fyS6pzT4j/sx/XUZxGXHUUDfRXLN+ke3Jt2se
	 /VmRA1o1iSqfO3F9BAJKqyDWjL26mIvJ8aogMlLx3DW4D52OTrdkRYaDsytjQzuqjY
	 +jsl7XdVcorjdO8itek7PV2RE3zZPYGDhPIbs6FOAr5Wt4cjh7QwuO/p80xnKPmcrd
	 /yRK98NlAZ4WKSi7s1Z/YLetFSCIOZwzra7zikCT6LEEhz/rBj2theQQVYlOR9wXgm
	 /mEu6xPBIdS+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] hwmon: (pmbus/adm1266) reject implausible blackbox
 record_count
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515-adm1266-fixes-v1-3-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-3-1c1ea1349cfe@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 23:20:43 +0000
Message-Id: <20260515232043.9E2D7C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver fails to use `hwmon_lock()` to serialize access to the =
nvmem cell, violating hardware monitoring subsystem architectural rules.
--

commit 82b651c5cd300cad751f056cdcdf20bb2cbb18c7
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) reject implausible blackbox record_count

This commit adds a bounds check to adm1266_nvmem_read_blackbox() to ensure
the record_count does not exceed the maximum capacity of the device memory
buffer. It caps the record count at 32 and returns an error if exceeded.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 94691dec13599..43d9e74077954 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> @@ -360,6 +361,8 @@ static int adm1266_nvmem_read_blackbox(struct adm1266=
_data *data, u8 *read_buff)
>  		return -EIO;
> =20
>  	record_count =3D buf[3];
> +	if (record_count > ADM1266_BLACKBOX_MAX_RECORDS)
> +		return -EIO;
> =20
>  	for (index =3D 0; index < record_count; index++) {
>  		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &inde=
x, read_buff);

This isn't a bug introduced by this patch, but while reviewing the blackbox
read path, is there a missing lock to serialize access to the nvmem cell?

According to the hardware monitoring subsystem guidelines, drivers must
implement locking for attributes registered outside the hwmon core, and sho=
uld
use hwmon_lock() and hwmon_unlock() for this purpose.

If multiple user space threads concurrently access the nvmem attribute, cou=
ld
this lead to a race condition where one thread clears or populates the shar=
ed
buffer while another thread copies that partially modified buffer to usersp=
ace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-adm1266-fi=
xes-v1-0-1c1ea1349cfe@nexthop.ai?part=3D3
