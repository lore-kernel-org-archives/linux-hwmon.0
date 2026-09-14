Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364A1E5B88;
	Mon, 14 Sep 2026 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374270; cv=none; b=ANtzayjAekMomKQFgRKhv8LAxNVifd8PqCIJQlCg8GtsYqB5euXaFmp7MVozpTJhIjCTvk7Sb0QqNDiL2p8TPwSpMG1se4522IOkUhnLQyrOw6k22HDc8HbZ5KaNuLDGXp4O7uFIIB8pK1DozXN8X7wCdyWbD6f5bn+Z4nGdQgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374270; c=relaxed/simple;
	bh=X+dyPXNbQ5okxSNJOsncS3NtPB4XWj6X/Tip6CM87Z4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cKEJAhsAzEg6R6ORV86nrge65JDxIgC0U0KdNHAyJVNxyLPDzjeyRddL9ykWh7w4iTD34HlvoB/iwOCPmbnjs2dOg2e9b6HR1TwbIX/OBtzBUkIJuUpArD2DV4MDAdRkUaanw5hIpNo5a0JS3NoCXhucgfH7qHT91My9rcG7FRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjtFklG1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjtFklG1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FE61F000FF;
	Mon, 14 Sep 2026 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374268;
	bh=X+dyPXNbQ5okxSNJOsncS3NtPB4XWj6X/Tip6CM87Z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CjtFklG1AbxiPPXz8Pn9ZsMqZbPFQ2HUmoZ2Z2WzIZ0HMQgq3MBwACfXw/RYnVKZ+
	 VuDDgV/IKzYVPhPcypyu6Df8lPlH/0dJGSPmdNcyMXz+6Powo2n8aUu8UDoGIq8RYf
	 a5wkcYEFVsDjx5e9DFzo/RaGECpx2xVbn+c4M6HSiaf1fQ5G2S+DWznudlh9YnOFjJ
	 FoFuy4hfUj3Ni5SAdkgYQio48vkDEuaze+K4ENOMZnFPAvGrKpLVRBbSDK/PKQoSYB
	 /komu2djrbgXbwJxU06XmwJrgsCz9ZShfbJd8RO906J2vRPTEzF4ecBWfrg5/up7D6
	 x9W4Zqi3sglfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:24:27 +0000
Message-Id: <20260914082428.56FE61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-ctl2301-v5=
-0-b44b81cd2c3c@linux.dev?part=3D2

