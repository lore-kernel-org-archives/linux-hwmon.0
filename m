Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907A97262E;
	Wed,  6 May 2026 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048400; cv=none; b=V4bo2Ex1BUmkUhbzpa/+JDMNAoHQQCV+y9B6CdPr6hf+v1pgQdWGudogeLbVSem+Fz7o1kvlIIQrUkigzkzel5i0ukGn3h/JrMffATpaGOl5B/IhWodPLDLwpdiXNdKyjHxdCAFplVfPU12rC/c1PmN3HPsO5vaOP3cMVZMRnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048400; c=relaxed/simple;
	bh=OAR1MXoDX3oDzJIB2viWM1MLByiBueRmSn1HrDL8EYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbttrLdAV6hcCTSph/40Sz33rV6EBRRVCTWY2ft1ygIEjHjkkzs9kKCfVUj7KqH5JhuVXtCtFfI20eBioHHrFNEGkXVlK34fMd5hXi/W6YZRahINJKDYdTjvF+2ztZY2QKnP98Wh/kSfYThfgj16fq+IJr/c3oRuCkyWzoFcaL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Y0Js75dI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Y0Js75dI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778048397;
	bh=OAR1MXoDX3oDzJIB2viWM1MLByiBueRmSn1HrDL8EYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0Js75dI0oJ0pebRI207JBKuCTwaawnfrauLc9KJMotV55BmV+TtegqPZbTdAYBC6
	 VmbLbqBUx//PeizdnMllWAD9b8zzGsQfCMRJZ1cbbs5QTrdJqEmS4Cx5rtQ8r+xCKy
	 0UQ2gC/oNtH4B+CP23+QzFlpLFnTnazehKzx1Jz8=
Date: Wed, 6 May 2026 08:19:57 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, 
	Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] hwmon: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <12d0ce1b-9d64-4cf6-9588-1f58d162bde5@t-8ch.de>
References: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>

On 2026-05-05 12:29:22+0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Thomas Weißschuh <linux@weissschuh.net> # cros_ec_hwmon.c

> ---
>  drivers/hwmon/applesmc.c            | 2 +-
>  drivers/hwmon/cros_ec_hwmon.c       | 2 +-
>  drivers/hwmon/intel-m10-bmc-hwmon.c | 2 +-
>  drivers/hwmon/nsa320-hwmon.c        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

(...)
