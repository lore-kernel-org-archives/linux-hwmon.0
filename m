Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865D1388393;
	Thu, 23 Jul 2026 16:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825652; cv=none; b=MF0bl+9yM0zGyv2HU73/gjJcqOl3YnnJpskUrdIjU7DPNkCOPO877mdCRIiUz+xwsmuifiwQMYdg6gP4mNlG/K/RmEj/i5JEVeTKfhivVGTWqFLM/bfqnQGVEd3j2hqTJZUso5A0eEI8PDz3qqpaLxBt9JjbUww/B5VjqdFid/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825652; c=relaxed/simple;
	bh=xdEKnFMPwpxYJ66PKQybVCtc1FcWDp42+7I0X7VpKp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OS10smn/GoY5+fpLzmGcpnS/pTgYGmH6z2ZIr+sMnWE5K7/nhGBztFDPHqM1m9yfmdwz4QMB6y8XEkLG3Xbt9TRSkMYBDJcfEw7KHp7mCtEDNBVPRA+o44wSxClsH/Tmv9UoHniKAvCjl+I0n1L+jjyXtZYUtmV93UKVJ06tWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ey6KhOQO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ey6KhOQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53971F000E9;
	Thu, 23 Jul 2026 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784825651;
	bh=xdEKnFMPwpxYJ66PKQybVCtc1FcWDp42+7I0X7VpKp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ey6KhOQO7iBaNFHG5aatz4pjP9uKvQo9BvJRvS+jGXsbzBf37Mm525OcC3/aP5CB/
	 NmrCFLkyaxGBMEYDratDSO7PMai1COPPXj858gM2Y/WHCZPwk4JVby1VutP4/xwHzi
	 1rSiFQQIonjYsh6UKZW1FlbnOxufc9+pFVZOrnArqGpoh1nNUnzhZZSYJNItjpDEQd
	 JtnO5KJ81hwnJ6IPY+jLANizzJq60KJq5btPwY9YVfgXbunvkkF07XWVLYjrWfpouy
	 1VvxACPMO7EyOg83h6GOSOd7WlUiHwtlDKNPcl0Nnq6q/8xBJ6bLO3vbvdpjLXX0/m
	 cFvOFveKOYXjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260723164249.199442-2-sanman.pradhan@hpe.com>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
 <20260723164249.199442-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:54:10 +0000
Message-Id: <20260723165410.B53971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add device tree binding documentation for the Analog Devices MAX16545 and
> MAX16550, and the Volterra VT7505 PMBus controllers.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723164249.1994=
42-1-sanman.pradhan@hpe.com?part=3D1

