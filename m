Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515009;
	b=HQHoE3YJmNjP0pJN9GDbZ9zVHt7YfGufQX9GOKamICNMzVaQVYHRMfIIQKzyXtWzh/D0
	 NPDhrTyCQskbOkl0C3LWOj7yKeo4HSZLu0eC/nM41kCWcFv+LWNmtn+L6x2d56+/J6vGM
	 hZiG1WctmFtTvipRpeY7P9dA2VmMwHkAtMsn8WIB1TmqbHSKbkBHK/9Xa87wztcuXgnJK
	 9+nvYNWYZ/HVb5S4qe1gqnM6DEQ0zmBFfPiWUf8XODbAOeLm4NpYQ5ZGn0oC2sVmgaMLs
	 9z/aHrm3slLi8JD7XE4883v9PX9++SZZJaAFdbijqmUIFVdwzXOrh0wwNR53jCzuH8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515009;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UC71RV7ZGXds+OWd3xE/QiSPlG2HbHyQMZE1/jJ7imQ=;
	b=FdWRd+7WBVJkWFTSLuBWx0ml3TVqAeZmPVOMqnyr5w7J3i3unHCu5IXeaWtGeN0cT2vP
	 32nSlyZYNNsXpIllxZBZFQCL+VRJiv6Na7ylRapoRQVJCdsieGfTGYYenRgddX3DphDrB
	 PpUukhpOvwufHDGZdjLdNB/dCTj/V6hJ5wXFpbvP2P3KNHNiyxxoCK4eG8CT7br3+2JAh
	 QT5BFkunxrBZ04S+kSb6C2m/r/u603IfCsa6KADFVdYu6sP8YcE8v6C+BP8f2U/XEmBdR
	 FjokGPBOSQGkEEt3qykM/hca8w6I2D4MEINzNBwSA35WuRms4XdeBOsFC+EE49AIPvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25013606A31A
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947951F000CB;
	Tue, 20 Oct 2026 16:50:08 +0000 (UTC)
Message-ID: <sashiko-outbox-179379@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add TDK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kevin Jia" <kjia@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-fs1603-v2-1-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
 <20261020-fs1603-v2-1-0986107a5cd2@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 16:49:38 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a vendor prefix for TDK Corporation.
>=20
> Link: https://www.tdk.com/
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-fs1603-v2-=
0-0986107a5cd2@nexthop.ai?part=3D1

