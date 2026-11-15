Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749773;
	b=RFvfp+myHo+a5JbpPApi0OhU1wzzDXKutPLdGOObidA1qtxZKbUzTdy3ah36SrXo2or1
	 9C7u+xSiiJ9T906TDwisdM+KrXHd0HZgoJj7915FrGQ7d3VlSdPYwrMZJ6mORsPc0MQjf
	 ny4CbVaXSTZoxvTjl57N/HUIfbbGNleVAECef6Lz4xX5ycWXk2QjcUzgHLTWAkjSnXoFJ
	 m5Q4eUxPlxrk7HW+7y9tqNGUKZFHYI+Ax9JOeD17ssZmMWZGptQ2Q4fMHOjhGHidtQdRG
	 1xpUWFdvX1ctMEfOdRHl6zMPuGEehkwMJe1GW/Zehbiu/rBhVzsATdHLoTUqmv8GiFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749773;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=bakunlIFWEDfHo2ZFFXHGFCwrwenum6e3Vhu2vGh9ds=;
	b=5pzvPJlvp03GPO6ym1yxJTq0lR40u2cl6YIUNj5gfycUfce580vxsEVfJpbCD4j3JyT9
	 /hXgpmeC2wGPZ1mGLiRP69zjm+amNSdiNc10rCmcZ0QUGE+bQcrwfEmHUyMyOiDLbQIc3
	 3yv3ul458VF7a54kodIxoYv1vTsbqzg/+LyMm32ixAXPCj4CEBT5AhhhMDa5VVSaN59AV
	 kASBAAtu336/4x8Cwy4J6mzJdU+FfVVttu2Si0yezADWuuucVVYaUOur/6W5TCNW3ts44
	 Jy0d0OucotjxO7dtAanA2AHqXfNru961l1F5NnjVqw6Vr9PgG8BmTjUmbhYfv30Qm7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pViYBZe4;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA0A606A31D
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 13:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA0A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pViYBZe4
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id SYU5xtMByAR1iSaOzxS8mp; Sun, 15 Nov 2026 13:36:13 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SaOyxHt5EGh2BSaOyxJnUw; Sun, 15 Nov 2026 13:36:12 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6af9b54c
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=p5UCd2gWKyfE8sLfB1wA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bakunlIFWEDfHo2ZFFXHGFCwrwenum6e3Vhu2vGh9ds=; b=pViYBZe4u8gXk1+FDOU6Q7g5wW
	dkM+tS80SNG9P4UKCbbsHEz+sxCYjpE6InFhxpeKVotbDDmziaN+0sDROYcN0i1hG3E+CPdqQqrUc
	lNxeon79faVFpVIUwCr/yaPbYEaEdiucnEtE5DbX1Ys0Yv916ls/QkCldglerUGQ+bzqQ1QBrb50F
	EXAmk2RDBwS0prMoz55D7hZ5bdgmYFfRtzUjEfX0+yqLytnIECNRrAje17TyEmMvPGkZyMejMWvAu
	hLFSrib0H8dlREeCnAt911TiB4I9gU5kCW0st7YovCKYMeoC6rTWhHp1rNK3w512Kh0tJq02fUC6E
	cfQn08ZA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52212 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSaOy-000000012kJ-07Da;
	Sun, 15 Nov 2026 19:06:12 +0530
Date: Sun, 15 Nov 2026 05:36:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ziheng Wei <zihengw03@163.com>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (w83791d) Fix incorrect struct cast in
 show_temp1() and store_temp1()
Message-ID: <bf6b651f-8739-4981-91cc-48925d3547e5@roeck-us.net>
References: <20261115080203.910033-1-zihengw03@163.com>
 <20261115080203.910033-3-zihengw03@163.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115080203.910033-3-zihengw03@163.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSaOy-000000012kJ-07Da
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52212
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJwNezVwD21R5S8d9wE0FcRwp41YJh4aAenBTtlEzxQiZrCd2XwTyQOyULP1rsS1+phVeQaRqEn6PBkBXW0aBX6qvWxS8KWlZoFpjLDucqLIhzhokMay
 6hfKrz6TVqfhHunkjX5n6lZpgvIZQIIzZ+dAPCQfAkcTGCPA8HpBZhI7thKMW/ZyFyosUsBHCaz81wL5YPtVrTjzszZJfbvMqgiChkVCg5N0CuWusumdleYa

On Sun, Nov 15, 2026 at 04:02:02PM +0800, Ziheng Wei wrote:
> On big-endian architectures, accessing the temp1_max and temp1_max_hyst
> sysfs attributes in the w83791d hardware monitoring driver uses a huge
> out-of-bounds index, because show_temp1() and store_temp1() downcast the
> attribute to the wrong struct.
> 
> The driver defines the temp1_* attributes with SENSOR_ATTR_2(), which
> initializes them as struct sensor_device_attribute_2 (where the index is
> an 8-bit u8). The temp1_input attribute has index 0, temp1_max has
> index 1 and temp1_max_hyst has index 2. However, show_temp1() and
> store_temp1() downcast the attribute to struct sensor_device_attribute
> (where the index is a 32-bit int) and use it to index data->temp1[].
> 
> Because both structs start with struct device_attribute, container_of()
> resolves to the same base address, but the field widths differ. On
> big-endian architectures, reading the 32-bit int from the memory layout
> of the two u8 fields yields index << 24: 0x01000000 for temp1_max and
> 0x02000000 for temp1_max_hyst, instead of 1 and 2. data->temp1[] has
> only 3 elements, so the access runs off the end of the array by up to
> 32 MiB.
> 
> Fix the type casts in show_temp1() and store_temp1().
> 
> Confirmed on a big-endian s390x QEMU guest with the driver bound to an
> emulated chip: temp1_max and temp1_max_hyst read 0 instead of the
> register values. Not tested on real hardware.
> 
> Fixes: 9873964d6eb2 ("[PATCH] HWMON: w83791d: New hardware monitoring driver for the Winbond W83791D")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

Applied.

Thanks,
Guenter
