Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2133388881;
	Wed,  3 Jun 2026 11:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486527; cv=none; b=cVSRPFf6DwbdObabLvoAndPvCZEdhwHHWKE5hzCsJCGb0K5Zlt16orV5cL2mwk0m/wPq3gBIdCDOmC2rYQvcNnqPY58F6Q1I7K+yo7imRPEtw6qTedAmGug+FFXzKXR66xiCZAURvdL1LqWsMDcnF9Ugdg8Gc9wghJiOFcQblsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486527; c=relaxed/simple;
	bh=L+fggEAvnIpbpkWXrZHlhCs7DGtNIhS8gj32wbrU9mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvQ0w4DbV/VrWySqn6dQxJIDUSayha3hKYvJ8FP5t28hyxLo7xCohTlKESaqjffBbjx9MhVukYsReEarmku2djX2wPoe42IvKJ+J499DEh1eBey0SbjN/ktAPoUoH3WGs3gqLdjZIoKyTfgBrEjyxXXyt17m1dpYpcM2HGpBwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koRQZrNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koRQZrNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232F61F00898;
	Wed,  3 Jun 2026 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780486526;
	bh=+QXiOfQEcvS7oD+1LooOvWTQClhyD757X2KRZLIKvFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koRQZrNfVfMw+kTCtYRxZYXN/yRw9AoNmFkpAtzz5DkbN8aF6FprTFLN1jONShNj6
	 7BaRu06PivBBFpdn3vtmwZOWkvk+0Hh5k2pIIdsAStbfy3rRMzGssaL11LxtgYyf+L
	 NdyIY4HQNNIaxOnyo29cA4U6kAwTcOD1FdaNpQA890+BjQ+65JMVgE06Yjh8S89CVM
	 MuWAVJ9xziw0MBbT9xkQC14kgnTqiqaZ6fe7PYNtYu+D/vcVYxGKIAjHhqP4kyiuXB
	 +JRxcpUgzKuxtHBBoik5ngHOUzUUQRih1lOaafboPB9zZODI4pdAS3BzuyVQyDQutj
	 0Uw8r8l96Gy9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-binding: hwmon: Add binding for ADT7462
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain Gantois" <romain.gantois@bootlin.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-adt7462-bindings-v1-1-301304bcf774@bootlin.com>
References: <20260603-adt7462-bindings-v1-1-301304bcf774@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:35:25 +0000
Message-Id: <20260603113526.232F61F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete binding migration: `onnn,adt7462` is not migrated to =
the new schema and remains in `trivial-devices.yaml`.
--

commit 8e3b73cf675c7a9534a713ae61c15469f85f0d06
Author: Kory Maincent <kory.maincent@bootlin.com>

dt-binding: hwmon: Add binding for ADT7462

This commit adds the ADT7462 hwmon Controller device tree bindings
documentation.

> diff --git a/Documentation/devicetree/bindings/hwmon/adt7462.yaml b/Docum=
entation/devicetree/bindings/hwmon/adt7462.yaml
> new file mode 100644
> index 0000000000000..745a371affd65
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adt7462.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adt7462

[Severity: Medium]
Should the existing onnn,adt7462 compatible string be migrated into this
new schema?

The ADT7462 device is already documented in trivial-devices.yaml under
the compatible string onnn,adt7462, which is actively used in existing
device trees.

By introducing this new schema without including onnn,adt7462 and without
removing it from trivial-devices.yaml, existing device trees will not
benefit from the detailed schema validation. This also leaves the subsystem
with two conflicting, fragmented representations of the same hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-adt7462-bi=
ndings-v1-0-301304bcf774@bootlin.com?part=3D1
