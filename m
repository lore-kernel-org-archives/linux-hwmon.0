Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237693EE1C7;
	Tue, 30 Jun 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811490; cv=none; b=fwK6PTx+Z1rYg3hv/WNuQYrW61glcWv4fAXWGGCyarF+45ehTj/ggGUYaNdVeli0D62SqDdXMZiYaRnPx2hfEpAgiggMeoUeyKrQiTri2ON1YPDXsHBZTnLuzSk4FDa7KIcCs3OEy2KrtHjP/9JpQF34TfA/PFRl0YGLO4YXPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811490; c=relaxed/simple;
	bh=Xgul8zlpuOwlJheHkaoVe9HUmDhkxInWOSx+oUGvF4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X2pwryBATLvmxprzGD2dej1L8Q6roy5RfzK0qKEsSAgngS3t/iwN81j7X9DwqeL7zgFk/tLFCQ5u6CizqST50Tt02r/CS8K4qDtFQhUuOMsaizUVIr32wTFFNn9cBFcbjml+0HBODuSsP79pI0oeQRML0xC4deJrub2u+62+H/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUlMB6Cg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUlMB6Cg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1670B1F000E9;
	Tue, 30 Jun 2026 09:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782811488;
	bh=Xgul8zlpuOwlJheHkaoVe9HUmDhkxInWOSx+oUGvF4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GUlMB6CgF/+C4J6H5ZDnY05vzqJZkeO4UsxCB9q/f8ylOomL9zbGr54XqMOVUdUkW
	 8MX8eQCGry5k9oGzCo1kIC5cd/Y/3FO3/0uoND1mFKYTa15orOrMNdJBkz1Ncq3uNF
	 V1/8v8Q7zw0jTs52RRii/ZmklWc0qyPo3Hh6cV2okXiyupNHXpr/nC8586RQHEFQqD
	 wucraDipeEbLF6kty5ppUXIiF1k9Z4k/uN6yvn9Hmm4FbA5VTyykq0rBAi93RLcvyU
	 +jN1H1kimp7LLRw/9309+lu33XkR6SxBMhjctMYwEMSBh+YYqtdlZw8dSOHckt3hzQ
	 6Xdxn5sv+I9qA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260630091122.1462-1-dongxuyang@eswincomputing.com>
References: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
 <20260630091122.1462-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 09:24:46 +0000
Message-Id: <20260630092448.1670B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Huan He <hehuan1@eswincomputing.com>
>=20
> Add device tree binding documentation for ESWIN EIC7700 Voltage and
> Temperature sensor.
>=20
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
>=20
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630091040.1407=
-1-dongxuyang@eswincomputing.com?part=3D1

