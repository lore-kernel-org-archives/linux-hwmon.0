Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E47377AAD;
	Wed, 14 Oct 2026 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002038; cv=none; b=o6N1FveotQYw1jUB7fLcfPxKLMswJZwEXAkjlVXh0fI5pHv4S4QVLjex0Htpf1hl8wZMWGYJ2rw8tCcvyn6MFgHteVyF+mI28CRwGkSXPjJ+FRp4DPG3KWj+9J4i1RbQAmGXVT3RKEGY1imHxwTcaFypo9BWRrDPaAH1ZubmBL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002038; c=relaxed/simple;
	bh=HOQd/xdM4sAke3u78emWdP9D/WXlb6Htxk91Pxg4QmQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VKDTIKDEkjxVqDoHVO9V673oOxjoX22ZfpEz2b/5eyK53wQRnzeEYJ3SHrN5fSY35g564kcpwvboJR8eMiL3QSj7u8CKgVUKLJZXWWhk0IPprANe6GO35lDT0x+kqQOrNXHnI9WowMMTVCt4H6PPtN2oK/HhrtGg5ezYyaSsgqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeovrYGy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeovrYGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792002036; x=1823538036;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HOQd/xdM4sAke3u78emWdP9D/WXlb6Htxk91Pxg4QmQ=;
  b=eeovrYGyVr6Vz66c3XxUHpbYmQuNHNymajpdNQlAiAndxvXmnhPwpA0A
   OMoGemBZUYVr/KzWurA/qHfLP+Ei0RWX2i7n0un/hKi1Qg/uLvn7PQ2WN
   FeB6w9+Fcy93c9PITphAY57YdvAkOslZtd4LfSa+MQtMLVZVuFMIZgV8B
   En6j1/GG6k2K24nf16eW+agWUidcKsDIJ6Zhi+QEaqcaIlDTw7nClJ6WF
   BND6ltk/ki10fKUYnPgmC1TC5o/Mzwgy1FTSn2qeddrWxQIDdtRILw4a9
   zHXoeNHa9zNU7IqUOBB+HzbmY20lDANoGOWoJnM8Oz2cQWYSM/8b8j/fq
   Q==;
X-CSE-ConnectionGUID: XRFSV1bER6iDvbgZrY+aQw==
X-CSE-MsgGUID: nUH9xiFhTCuLULM4dw1O+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="658149"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="658149"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:20:30 -0700
X-CSE-ConnectionGUID: K0WeQ58XTPW9uYRLRQ1kjw==
X-CSE-MsgGUID: RZSsfdpHRte4GH0IJu6YFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1517070"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:20:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 21:20:21 +0300 (EEST)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
    Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] platform: arm64: Add a driver for the EC found
 on ASUS Glymur machines
In-Reply-To: <5c87c231-6c76-4363-9f4d-6c43dd63ee9f@oss.qualcomm.com>
Message-ID: <81e7e5b7-247b-b57f-5d78-4fac468ab121@linux.intel.com>
References: <20260923-topic-asus_ec-v3-0-2bf3bb9da879@oss.qualcomm.com> <20260923-topic-asus_ec-v3-2-2bf3bb9da879@oss.qualcomm.com> <d20f4159-de71-7e9d-46a6-5953364937cd@linux.intel.com> <5c87c231-6c76-4363-9f4d-6c43dd63ee9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-707764721-1792002021=:1157"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-707764721-1792002021=:1157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 14 Oct 2026, Konrad Dybcio wrote:

> On 10/8/26 1:28 PM, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 23 Sep 2026, Konrad Dybcio wrote:
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
>=20
> >> +=09ret =3D asus_qcom_ec_write(ec, ASUS_QCOM_EC_RECM_OFFS, frame,
> >> +=09=09=09=09 ASUS_QCOM_EC_RECM_FRAME_LEN);
> >> +=09if (ret < 0)
> >> +=09=09return ret;
> >> +
> >> +=09ret =3D asus_qcom_ec_read(ec, ASUS_QCOM_EC_RECM_OFFS, resp,
> >> +=09=09=09=09ASUS_QCOM_EC_RECM_FRAME_LEN);
> >> +=09if (ret < 0)
> >> +=09=09return ret;
> >> +
> >> +=09*out =3D (count =3D=3D 2) ? get_unaligned_le16(resp) : resp[0];
> >=20
> > Same problem here when it comes to sparse.
> >=20
> > Does the ec really input be16 and output le16?
>=20
> Yep, it really does..

I suggest you mention it in a comment then, as otherwise somebody else=20
might wonder the same thing. :-)

> Ack for the other comments
>=20
> Konrad
>=20

--=20
 i.

--8323328-707764721-1792002021=:1157--
