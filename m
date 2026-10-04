Received: from aib29aea145.syd1.oracleemaildelivery.com (aib29aea145.syd1.oracleemaildelivery.com [192.29.151.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965F379993
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2026 01:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.29.151.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791077276; cv=none; b=PT1y2WaCTCaHgc9kMK4IrkSUGd46B33NfoGQHtpwWgO0kSFHAdJyaze36eXmK6y4VoKVQjqaYc8VoKh92XNCcliuNgmUeVTcwbx12ecXmcjX9waUx4dL3JmACH7yxom53zNl5m3GfJCQjzU6FMjvB6itt19EDXYckjjjbUA6/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791077276; c=relaxed/simple;
	bh=YHwjaGEXhooScUMhN4sjKblUiQTTIR+wIjD3ycbLnbQ=;
	h=Message-id:Date:MIME-version:Subject:To:Cc:References:From:
	 In-reply-to:Content-type; b=ILvgDuiAqqrfVOfcCYjYzxSyVgviwMKOgHQov5VmyVCZwyD4jN+ZzH2E6DEB+uzWkixiuGZjpMicMWMXbxkkwTzODrnLKdFHW3HHLQ/SYxTr36FmNsD1daURNAMPOltuMmu4bgXVDONwXLNK1o4i3f0toMCmzrF2WPOfZa4+MXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stevetech.au; spf=pass smtp.mailfrom=syd1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=stevetech.au header.i=@stevetech.au header.b=NQnUp56v; dkim=pass (2048-bit key) header.d=syd1.rp.oracleemaildelivery.com header.i=@syd1.rp.oracleemaildelivery.com header.b=E14yi3io; arc=none smtp.client-ip=192.29.151.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stevetech.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syd1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stevetech.au header.i=@stevetech.au header.b="NQnUp56v";
	dkim=pass (2048-bit key) header.d=syd1.rp.oracleemaildelivery.com header.i=@syd1.rp.oracleemaildelivery.com header.b="E14yi3io"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-2026;
 d=stevetech.au;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=kpjG6rYXPTe/tizbo7cfjo5Jk+SyMjAmc1fPSNDuai4=;
 b=NQnUp56vheBunbWhvQPI+Ai90BFnwy7MHCpR8pJZ8W/34d5JV6zSpJYOA80JGW2+H1eVNIWINN/l
   6T4UtkdSYaP6zJWdF8yl1rL1vapJpmOxvMqHn18MyQOt6El00sb/r3ighP3UV8sT0HFAihmUpn4j
   E8k1p9tX2fmMkmXv5Em1sMDhPTMy/K6OwMbrylewMhAo4h+B2qQleX+biWMWJJalNrGdOoBOICUS
   BH9rjNGe8N3qCrv4MNACgDSICloWI6G3Y3xhqpZSpAL0w1OZO597APSmbVyZZxK753BnZiHFBWUl
   0QXxiJQtOGuj1xiYxciI90422CMIoRv4ETF4jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-syd-20200122;
 d=syd1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=kpjG6rYXPTe/tizbo7cfjo5Jk+SyMjAmc1fPSNDuai4=;
 b=E14yi3iobvJYkor+jGiJXqX+bsbXKZo0o4W+7/OCMXCkr2IOXE5ELDssxHPZtZT494vZOReLRdgB
   z+hr2diHOx419o/UMHdZfbIIPkQUXppWZQ283CXZC49hN0KrMzlb/eFeZusCAvU/YnZXFcm1OHum
   xBvnYZ3K1urnpTCPm0EcKiyKNyElk5hWYg/S7pK5K4g7kKfIyAzKlMzRwitMlBpN1zgpNcDnn/lc
   +cfrdhF4/hI1ALq+7DBI9L+fNsB4CO6V5mxqTMok47WkT0lbL5IMosEUwSiA7F9PlHzBDQJhY7ey
   8NFPrW8qyaLjpSOsdoGkMa1o6HnvqPJ+JdlfSA==
Received: by omta-ad1-fd1-1401-ap-sydney-1.omtaad1.vcndpsyd.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260817 64bit (built Aug 17
 2026))
 with ESMTPS id <0TMD0SVKP02GK190@omta-ad1-fd1-1401-ap-sydney-1.omtaad1.vcndpsyd.oraclevcn.com> for
 linux-hwmon@vger.kernel.org; Sun, 04 Oct 2026 01:27:52 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-id: <736f095c-d7d3-4023-a2c0-0b5fbb1baa78@stevetech.au>
Date: Sun, 4 Oct 2026 11:27:49 +1000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
To: Mirko Jechow <mirko.jechow@gmx.de>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Jihong Min <hurryman2212@gmail.com>
References: <20261004002731.49927-1-mirko.jechow@gmx.de>
From: Stephen Horvath <linux@stevetech.au>
Content-language: en-AU, en-US, en-GB
In-reply-to: <20261004002731.49927-1-mirko.jechow@gmx.de>
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAHV7gL8JXoT6sfqXyJYFrulzXJdLpnzbDVduAssYr0JF2y5vo/IUbz12dA/L56G
 IrlTQ/k3MADBWKY+uIyAVcindxxYfs1QOPRLW/H8fReyxrAcmVXziN/+V/XogfFj
 KTXd1p23GNKFhaWEuwXU4G+rsSMWZ4SotWLcLZ5eMCl7tf5sUyUVBhTZ5bI4MdP2
 TmqC5g3RUe+l94CKVWoAE/usVp5/KIEFdUWCK6fiGf3qluxsz4ADcePlSAVyffFT
 /qj4EL0FAb5iUaNB7i813iFciAINOF0f8wUEnHLFDVPjWBkzscd9F+KjpciD9P3l
 mzhh/4GBSQt9kJmquxvtxm7EbTCWEPLIYEny+d6YdZ8/8l4aT1D6zIncxcmLFQ8K
 sv3M0xPBRly7wdu6caXZoN3TD8VTPhRwGkmZ2tcglngQxR2qt1HHjxq5TMbbRy8=

Hi Mirko.

On 4/10/26 10:27, Mirko Jechow wrote:
> From: Stephen Horvath <linux@stevetech.au>
> 
> It seems the xhci-pci-prom21 module only has IDs for the 800 series
> chipsets. However, the 600 series chipsets also have Promontory 21
> chips, so we should add their IDs to the list as well.
> 
> I have tested this on my X670 board featuring DID `0x43f7`.
> 
> `1022:43f7` also appears on the PCI ID database
> (https://pci-ids.ucw.cz/read/PC/1022/43f7).
> Device IDs `0x43f9` (B665) & `0x43fa` (A620) were suggested by Shyam.
> 
> Also list the new IDs in Documentation/hwmon/prom21-xhci.rst.
> 
> Cc: stable@vger.kernel.org # 7.2.x
> Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Cc: Jihong Min <hurryman2212@gmail.com>
> Signed-off-by: Stephen Horvath <linux@stevetech.au>
> Tested-by: Mirko Jechow <mirko.jechow@gmx.de>
> [mirko.jechow@gmx.de: add new IDs to prom21-xhci.rst]
> Signed-off-by: Mirko Jechow <mirko.jechow@gmx.de>
> ---
> Changes in v3:
> - List the new IDs on the PCI IDs line of Documentation/hwmon/prom21-xhci.rst
>   (requested by Jihong Min)
> - Picked up from Stephen; v2 had no follow-up since 2026-08-23

Thanks for picking this up! Sorry I've been busy and forgot about this.

> - Link to v2: https://patch.msgid.link/20260820-xhci-pci-prom21-v2-1-638e5958fbbf@stevetech.au
> ---
>  Documentation/hwmon/prom21-xhci.rst | 2 +-
>  drivers/usb/host/xhci-pci-prom21.c  | 3 +++
>  drivers/usb/host/xhci-pci.c         | 3 +++
>  drivers/usb/host/xhci-pci.h         | 3 +++
>  4 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/prom21-xhci.rst b/Documentation/hwmon/prom21-xhci.rst
> index 7984fb187bd8a..6c0b6e7368921 100644
> --- a/Documentation/hwmon/prom21-xhci.rst
> +++ b/Documentation/hwmon/prom21-xhci.rst
> @@ -9,7 +9,7 @@ Supported chips:
>  
>      Prefix: 'prom21_xhci'
>  
> -    PCI IDs: 1022:43fc, 1022:43fd
> +    PCI IDs: 1022:43f7, 1022:43f9, 1022:43fa, 1022:43fc, 1022:43fd
>  
>  Author:
>  

Looks good to me!

Thanks,
Steve
