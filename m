Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B74730C605;
	Thu, 22 Jan 2026 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107921; cv=none; b=FMXgmG4FAKzvOQdoyj4aFa8KBQk9naNm9MwcRb7kCPfTBB73Qa3INHQq3k0spSB44miHhwtORxreQ2jFjkjJ/GJ98pXHiwMCK5s31ZeU0FTVsp1WLtXpaVz9nRZ8FrH7nEW4zqzDopDSoVNudfO1mIiBD9o7cq2aXRGWuPCzLuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107921; c=relaxed/simple;
	bh=cPdCj1wqVzJvlB5XIjxAAwgNxf+s8uM2mmVEkvyvHBI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ObSAiwvtNwyCUvrsAIL+//dy5IlXfzKH3cYj18cKdfiggt2ajYWAAUIiRkOUASHITttEHJrKi5ZfLbm/Xg60Wrn0SZWFnQX1oesB7c2jUZEMTjsgf/BGRmot3R2Taz13MHSVEjAAtjGg864foFs/YX6mrnHFymMGAF68pE+tY+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=JEH+CT9N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RReZdkSg; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="JEH+CT9N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RReZdkSg"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E359E1D00061;
	Thu, 22 Jan 2026 13:51:46 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Thu, 22 Jan 2026 13:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1769107906;
	 x=1769194306; bh=7JGvKBUhV1Z455SWki+7hsea9Y0Ea83UzmZknv7N42o=; b=
	JEH+CT9NjjQJmnByk8GmoO22bEIazW1Ew8WZohoLlmFitbkXNS3oR/w02irapVhC
	DkdiElGxlG4eWhFT9Nq2KmpNdRaTjZoukNVAbJR3v1HBXFNJCRJK0LU9CZyDjWwJ
	A4iOJaorXigzwi3MshVEoG+fKrnhhRoWv3+B1uOyxYtdkrSC/gMPNx6MAyoLSE11
	xmxCXuYzz90ZCCsiO/DBCVWEmb6XiVL4NYbTvablkLBAZ+DtR/l8EQ3RsHaWrYFt
	ayqk0Y1qU1VCPGJLJIG4YmU2pRy5BE4Uus353zHwL8Eu6SKpEERsBlQGXj4zI1Sq
	momldhKJrTx5yImoCmFBUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769107906; x=
	1769194306; bh=7JGvKBUhV1Z455SWki+7hsea9Y0Ea83UzmZknv7N42o=; b=R
	ReZdkSgIjNNNUJPgX9nEd8PRVUP0pHZBWSX4E6kkJSBaVSwsxoJuSjjr9sVIrYn0
	YZZUbhHaOR9cJpIbN1UY/sf4OpPj8ahq1nt1NiXI9t33E9e6T0758pZOtVKWmJdV
	vjKUwbzL/W5Rm/pMaMQDzqW+R9Frh8XsCrpGuL8MT/7FaH5Q0k3aG/dME2SoPooV
	VWhUCkoEt1CAHYjkYdNDFO32BU3dUBZDEFxp7BphvZyQmOldJTJCLcfrPdn5r/Lq
	709bzVlAV9t4q6U26ryVkUWrBjcp214zpJhssUA8gx94+qczFD0+IdXlRxuYEvlH
	Aeb82wHzjznyqpn49I9uQ==
X-ME-Sender: <xms:wnFyaYWOT4a13zPvmCdBThrTFeLRpefDcHbue-oII-nJK-Aq8nZPgw>
    <xme:wnFyaXYAFj6MO-mOhvbD8QRgO3-BNadEbYboipJQChA3gk40WD-rQbXHskEyLax0m
    d0cV082b3sR5sdtl-Eu6qdzbXTYJrShUiA8541zQghncUXjTxpz1V9n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeiledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpedtffevgfethfevteduvdefleevkedtuddvlefghefg
    ieekffejteejveffkedthfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepuddtpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepkhhuuhhrthgssehgmhgrihhlrdgtohhmpdhrtghpth
    htohepfigprghrmhhinhesghhmgidruggvpdhrtghpthhtohephhgrnhhsgheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdp
    rhgtphhtthhopehisehrohhnghdrmhhovgdprhgtphhtthhopehlihhnuhigqdhhfihmoh
    hnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wnFyabAVRJP88x_rIedixgWvCIaK57cV8si79L5UR4nHodxHx2NQog>
    <xmx:wnFyafzhMeD1awfk52xXAo08IJZVlFuG1QWoJ8GmRAaeviqk9PCrzQ>
    <xmx:wnFyaf7j4xmko9ppIytwoUhWAi6GH4ZtY1LdShnLRDqYGLCg2V4PMw>
    <xmx:wnFyaQwa6y2S6qJ3nFJZFa1ofxjU8oCB-7GuXn5wmw2zpS6FMTeYWw>
    <xmx:wnFyaY_L6OifWcRZrVvTiuXuWpnf-4ji9m0kEMkYggySbzsCA8Tl8FiY>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 03ABB2CE0078; Thu, 22 Jan 2026 13:51:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AkBZZoDIVo5V
Date: Thu, 22 Jan 2026 13:51:25 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Message-Id: <94a3798f-c6da-4b26-b082-d1b56d059019@app.fastmail.com>
In-Reply-To: <20260120182104.163424-2-i@rong.moe>
References: <20260120182104.163424-1-i@rong.moe>
 <20260120182104.163424-2-i@rong.moe>
Subject: Re: [PATCH v11 1/7] platform/x86: lenovo-wmi-helpers: Convert returned buffer
 into u32
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jan 20, 2026, at 1:20 PM, Rong Zhang wrote:
> The Windows WMI-ACPI driver converts all ACPI objects into a common
> buffer format, so returning a buffer with four bytes will look like an
> integer for WMI consumers under Windows.
>
> Therefore, some devices may simply implement the corresponding ACPI
> methods to always return a buffer. While lwmi_dev_evaluate_int() expects
> an integer (u32), convert returned >=4B buffer into u32 to support these
> devices.
>
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Link: https://lore.kernel.org/r/f1787927-b655-4321-b9d9-bc12353c72db@gmx.de/
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Changes in v7:
> - Fix mistakenly inverted boundary check
>
> Changes in v4:
> - Accept oversized buffer (thanks Armin Wolf)
> - Use get_unaligned_le32() (ditto)
>
> Changes in v2:
> - New patch (thanks Armin Wolf)
> ---
>  drivers/platform/x86/lenovo/wmi-helpers.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c 
> b/drivers/platform/x86/lenovo/wmi-helpers.c
> index f6fef6296251e..7379defac5002 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.c
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.c
> @@ -21,6 +21,7 @@
>  #include <linux/errno.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
> +#include <linux/unaligned.h>
>  #include <linux/wmi.h>
> 
>  #include "wmi-helpers.h"
> @@ -59,10 +60,24 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, 
> u8 instance, u32 method_id,
>  		if (!ret_obj)
>  			return -ENODATA;
> 
> -		if (ret_obj->type != ACPI_TYPE_INTEGER)
> -			return -ENXIO;
> +		switch (ret_obj->type) {
> +		/*
> +		 * The ACPI method may simply return a buffer when a u32
> +		 * is expected. This is valid on Windows as its WMI-ACPI
> +		 * driver converts everything to a common buffer.
> +		 */
> +		case ACPI_TYPE_BUFFER:
> +			if (ret_obj->buffer.length < sizeof(u32))
> +				return -ENXIO;
> 
> -		*retval = (u32)ret_obj->integer.value;
> +			*retval = get_unaligned_le32(ret_obj->buffer.pointer);
> +			return 0;
> +		case ACPI_TYPE_INTEGER:
> +			*retval = (u32)ret_obj->integer.value;
> +			return 0;
> +		default:
> +			return -ENXIO;
> +		}
>  	}
> 
>  	return 0;
> -- 
> 2.51.0

Looks good to me.

As an aside, you've answered a question that was puzzling me for something we're working on internally as to why the Windows dev team hadn't complained about different formats between platforms for their implementations (which was causing me a ton of pain). Now it all makes sense!

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
