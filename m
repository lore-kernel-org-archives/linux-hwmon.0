Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE90471408;
	Fri, 16 Oct 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147834; cv=none; b=tlvmIU5Eu/PTo7XbReoCXXGW5W9goL1Ukvm7t/RKNrR5xmFQsNTne6faKNKaDCUYadjG99hg6aQhaBqBi4KTwO5r5FlpitUzdPJX6Sb7/wpROVVdRuf2gG3VPhnvuRle9NCkRZCS9ZyV51BwJ5cKXlE+G3vMjJmzXw7cofS7JkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147834; c=relaxed/simple;
	bh=QuTUpXOUCaUuBOC1UbPUqse6N0EFcQRqSPKqz3NAqFs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o9UF5AM4TQ70PEN7VLkhdw5E2Rt+7CHpiZiKSZVQUDCvu2+w5RsM08srpkKhDCwy7ll7wf+Y7/TxvJG6/8MNfIc/ACNSbZLQKvGsw3KH3+ri76T16VLxqKQgxpT8LpFr31p1Ch83HJRS5oPa0oN2qz5bv7SHOGrTtiPYBZXH6QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Se2sqRSe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Se2sqRSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792147832; x=1823683832;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QuTUpXOUCaUuBOC1UbPUqse6N0EFcQRqSPKqz3NAqFs=;
  b=Se2sqRSeb2FgWNQgLKfCR6Q1N2Zv2ZBvezWG1F3VD7YpQrVzNOzXtD0b
   xsHK0wwXxVX3mzlre/W0WREwRhoDvDMau1OMdwb8tuJtHSuwXzoffzazP
   0QoOnqSIiZK6wLMz8sf0i7FxiYeJPM8+3sqvNEaktF5FvvAHCcSUbBBUw
   2g18eSwv21wIxG1b5Z4buOvArsIVFyp2akKwARqi4h965lDGphZEPsSVZ
   N6UMfw25cnqXgXe5UW+idQz1oWa35E+Vk/tXzZpaouHfMdRjFtc2DAbDW
   lUzWL7DJ9gR4BA19c0HdIENCt1gCG+oiebiPBkNpkz7GjW0YPe2B/q4I9
   w==;
X-CSE-ConnectionGUID: frXJgo58RfqbbVGv8D4peg==
X-CSE-MsgGUID: HdbjNfjcQU+Ml49qUCZ1MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813144"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813144"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:50:30 -0700
X-CSE-ConnectionGUID: tS1l6KnoTtyw9/CX2dJCKg==
X-CSE-MsgGUID: Okq7koC+Ti6Lzl5JCFYy8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1991378"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:50:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 Oct 2026 13:50:21 +0300 (EEST)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
    Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found
 on ASUS Glymur machines
In-Reply-To: <e4cec04d-2c66-4900-940c-d7d3d245cc64@oss.qualcomm.com>
Message-ID: <f97000c4-496d-0ce1-318a-1df5c0de804b@linux.intel.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com> <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com> <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com> <e4cec04d-2c66-4900-940c-d7d3d245cc64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1896846893-1792147821=:1180"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1896846893-1792147821=:1180
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 15 Oct 2026, Konrad Dybcio wrote:

> On 10/15/26 4:24 PM, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 15 Oct 2026, Konrad Dybcio wrote:
> >=20
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> >> least the Zenbook A14 and A16) expose a custom, somewhat
> >> Qualcomm reference-derived EC interface. Introduce a driver to
> >> communicate with said EC, allowing for fan speed reporting, keyboard
> >> backlight setting and receiving of a number of miscellaneous sideband
> >> events.
>=20
> [...]
>=20
> >> +/* RAM addresses are sent MSB first, while returned data is LSB first=
=2E */
> >> +struct asus_qcom_ec_ram_request {
> >> +=09__be16 addr;
> >> +=09u8 count;
> >> +=09u8 reserved[2];
> >> +} __packed;
> >> +
> >> +struct asus_qcom_ec_ram_response {
> >> +=09__le16 data;
> >> +=09u8 unused[3];
> >> +} __packed;
> >=20
> > Endianness stuff looks sane now but __packed also needs an include.
>=20
> Some fun statistics:
>=20
> $ rg compiler_attributes.h drivers -l | wc -l
> 30

You didn't consider compiler.h -> compiler_types.h ->=20
compiler_attributes.h that seems a guaranteed include path to me. The=20
numbers would be slightly better with that.

> $ rg __packed drivers -l | wc -l
> 1228
>=20
> [...]

So lets not add another mine to what is already a scary minefield. :-)

The indirect include paths are a minefield if somebody ever wants to=20
refactor a header. I know some maintainers may be more lax on this but=20
here we try to follow include-what-you-use principle to extent that is=20
reasonable (when the include path is guaranteed such as=20
platform_device.h -> device.h or linux/x.h -> asm.h you can only include=20
the former ones).

> >> +static int asus_qcom_ec_read_ram(struct asus_ec *ec, u16 addr, u8 cou=
nt, u16 *out)
> >> +{
> >> +=09struct asus_qcom_ec_ram_request req =3D {
> >> +=09=09.addr =3D cpu_to_be16(addr),
> >> +=09=09.count =3D count,
> >> +=09=09.reserved =3D { 0 },
> >=20
> > 0 is the default init value so generally =3D {} should be enough but I =
think=20
> > it's not necessary to add the reserved member at all because the entire=
=20
> > struct should be initialized anyway by the surrounding construct.
> >=20
> > With these fixed,
> >=20
> > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
> Yeah I know. I still left it in deliberately so that in case anyone
> wants to audit the format here and compare it to the DSDT it's more
> obvious that this wasn't an oversight. Do you still prefer I resend
> (or maybe you'd like to fix that up while applying, which I don't
> mind either)?

We can keep the member there but I'll change it to {}.

I can try to remember to fix these while applying (I'm good in=20
forgetting though :-)). But I at least try to check all the comments made=
=20
to the last version.

--=20
 i.

--8323328-1896846893-1792147821=:1180--
