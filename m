Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977551C328;
	Wed, 30 Sep 2026 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789278; cv=none; b=iJRvG9MyQtqSUb4Ja1T8Bygi43qCIq8Em83EQ2bAYIekIy5gaxTWjiA6pWN83yfIYzBDNig3n761dFLiSkdsqd9XKmblYBgwXqwDk/1cHKmCgXlW3ssdswZowFlNwEDbIT3eD9Z2FlSfz4rLa44uR/LCT6Xd4EZszRB5VOnnPyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789278; c=relaxed/simple;
	bh=1YHG2rE9ss1U1QReWOicrFSdQV3cGvCpHHxTMkL5/T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjTtJ08tlOmfPeEeLGn0xRcMH7qFxdNAAnBqhF2KLWBhAhLvH10MxRL55A0K/IJtTDISKOm0dUNL1WqvhZ0zBGNWzPi+N/HaqYdY6sG1lTULxTkJxaLVI9MiCudZsJrhuVWEZHswSK0pdyC2Vr8Zi2OWL1q9dWaejc3rnCKQFsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=ZyV8N3vx; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="ZyV8N3vx"
Received: from L20747.iliad.fr (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 533EA780368;
	Wed, 30 Sep 2026 19:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1790789273;
	bh=1YHG2rE9ss1U1QReWOicrFSdQV3cGvCpHHxTMkL5/T8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZyV8N3vxVwMl6IwLk6s0ocI/xC1/O7RUgZ/DUrXsHz/V6hAIOAIsP9+bWhCHqfUsk
	 gDGfTWAs6psQ6AYtMEEJnDLwc5uBat3lbqfQOAJcb/9DfXsSzw3b7UJON1wYQcHc8+
	 6a/UhCVUa0VnKvWz537bhiqhCDSZ2yZdnorJ5zgiW5S/2eM+lL36tHUIfsW/r8LJmW
	 7HX0p2lUYdpT8Q0RXe6G/rJJJK2cVOirwMVFuG8ebuQtLrX64Pd2HJkyzqm5jrHj61
	 sgOYqhqLIiSVG7PnB5t10uc5Md+r9btoOVme68qTN3qjUcOdf2jBsqr1IHfWCmuLAq
	 ycZkbJ7mQXAYg==
Date: Wed, 30 Sep 2026 19:27:43 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <ar1Gj2XVOCEjUY0l@L20747.iliad.fr>
References: <20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr>
 <20260930140721.E066D1F0089D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930140721.E066D1F0089D@smtp.kernel.org>

Hi Guenter,

On Wed, Sep 30, 2026 at 02:07:21PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Is it correct to set the cell count constraint to 1 for this hardware?
>
> The Devicetree specification generally mandates that single-sensor devices
> use a cell count of 0, as no index is needed to identify the sensor. By
> forcing this to 1, it appears we might be baking a Linux-specific driver
> quirk (the PMBus core's internal 1-based index) into the OS-agnostic
> hardware description ABI.

M. Bot has a point, and it is a PMBus core question, so I would like
your view before a v2 of this binding.

Since the commit
  3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
pmbus_core registers each temperature input using its hwmon index as the
sensor id, so temp1 is sensor 1.

The hwmon core counts from 0 instead:
for example temp1 is sensor 0 for jc42, tmp401, lm90 or adt7470.

With the 1 based id, a single-sensor PMBus device cannot use
#thermal-sensor-cells = <0>: thermal_of matches a phandle without
cells as id 0, and no PMBus sensor has id 0. That is why this patch
uses const 1.

No current DTS references a PMBus device from a thermal zone, and no
PMBus binding allows #thermal-sensor-cells yet.

Aligning PMBus on the hwmon core would mean:

drivers/hwmon/pmbus/pmbus_core.c
static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
  ...
 	if (class == PSC_TEMPERATURE && strcmp(type, "input") == 0)
-		pmbus_thermal_add_sensor(data, sensor, seq);
+		pmbus_thermal_add_sensor(data, sensor, seq - 1);

 	return sensor;
 }


If you agree, I will send it, with a v2 of this binding using
const: 0, since each device of mps,mpq8785.yaml has a
single temperature input. Otherwise, we should keep const 1.

Best regards,
  Vincent
