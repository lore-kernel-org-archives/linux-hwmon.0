Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202884;
	b=S3vrX+jSb2W8kSS9VdjHk1Lpv3/zYyDYfJcL9NotGQqWC1eMJShQC68dlTeuxfF5cSzu
	 5Y6aR549wamORQh0zPDIev1ZWkS+pfXSwFhLT4+TFBSkxTmKxVhW5l8vIbjSpLctGcQ7T
	 bVqs9PIQ/HYhrmDVzgsHJdGjlyfLOytt3yK4A4m/DknuCjdlXiEdJx3NCEG/R6448ZR9G
	 ZoZ3mXaiy+E3uRqBSpuqvH0bf6Oq3Mhf+u9EU0RoDkNxkFlvC824IOeOkxyadRi77+aZB
	 dYGVLvKfabmPJY3LKAraz9jaA0zify2NMMYFc4BExZnmcCynH9Gea9TZeCd0favdEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202884;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=gnYPuq+nfUoCLw60qwnW2GrHs/UIDVhrl71N5w+lQr0=;
	b=z3cmbs4CH4+EwtEmmQRQyiYS7yaNHzzaoxFNIuQy8zZLGcYf3mize39BXl1Ont1XEtS+
	 pHuQOdDQZDw8/wKSiFj49zJb9otvFsJiQ2ZUZciIYtrvMrdcggzPhUHIofFcQTB6rcYmR
	 JTutnY1huoqNM6aEf04vi3vtwsKntvzRD3zIN9M60FCruIAQimIALyZC54dU2I1Ttouh9
	 JeQSp1jqw8JwpvV/S2u2PNXK8cBYpItnPGhqlz4YJgEznbpyako6Sbbu7THqIIa7zuBzU
	 nXK5VUEwntW/RDFZ65h5ofmhFhAcYHgtXwQ9SxWrS2uZmw+Xcb2W701nrKyRqopNSsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=kmWO5kJV;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF80606A6C4
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 19:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF80606A6C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=kmWO5kJV
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id UMLcxHbgFAR1iUUHDxHF4O; Fri, 20 Nov 2026 19:28:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UUHDxMU0MuJrPUUHDxim5h; Fri, 20 Nov 2026 19:28:03 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6b009f43
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=1XWaLZrsAAAA:8
 a=vSM2nOtyJHX8j6J2hBEA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gnYPuq+nfUoCLw60qwnW2GrHs/UIDVhrl71N5w+lQr0=; b=kmWO5kJVAcjqKl8c4sqHRSB3aW
	eX7gLI+TFyv61YeB5R9WH8mvIEXvxEDXPieAr2nmCEvZ+wtC/IDrNzScsbI9Oyb46P3SmQwl2bAvI
	2JYLRn4P1BbDJXtK0EXq8G8efnl4BuAUxUj7+xt0cAtXpxe3uExTNSedl05E3k2R3NF5rRtuCm5lf
	sL1oGD++vKSLFh8Gsym3iQSmIxzGjNdwZr3GcY1E41kRn87yH+c+EZ3ohMuNc3K0Yb+hS3q9hnuKz
	vzciIAEAFCvxywq8DYS4glphIVpGHxZxp7Y70K2F8q0ykUysLhDKAHplTwyxLao2IbD4dxFO/w+K7
	MzqLDcOA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45684 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUUHC-00000001XQr-3D0J;
	Sat, 21 Nov 2026 00:58:02 +0530
Date: Fri, 20 Nov 2026 11:28:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arthur Korn <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/max16601) Support byte data writes
 on VSA rail
Message-ID: <86af448b-50da-406a-8ed3-7796dc9b7252@roeck-us.net>
References: <20261120024416.338876-1-akorn@google.com>
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
In-Reply-To: <20261120024416.338876-1-akorn@google.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUUHC-00000001XQr-3D0J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45684
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 16
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI6RZHofk299nB+hNhpNudiSPhubAdAPh90z9izsJ17Ad11SXCypn2wslww8yqhjXJjfIpI33+bvKnGA7RhQLQr+vyFXwCHsRAQTxOICkpvz0m/WIUdP
 tSAMpNdbnq3h4kfKll5ar3rnhX6q0O79J+nC7QcVh8aVwXoAiuvApEr5Ajd9Flkfydmq4q7+VtjUyhm0i+V7M2RbxDgrcwtj5Wcm4DI/rGNLAIJgvttTzNNT

On Fri, Nov 20, 2026 at 02:44:15AM +0000, Arthur Korn wrote:
> MAX16601 exposes the secondary VSA rail on virtual PMBus page 2 backed
> by a separate I2C client (data->vsa), while page 1 is a read-only
> virtual page for VCORE input current and power telemetry. Although the
> driver routes byte reads on page 2 to data->vsa via max16601_read_byte()
> and PMBUS_CLEAR_FAULTS byte writes via max16601_write_byte(), it does
> not implement write_byte_data(), and max16601_write_byte() falls through
> to -ENODATA on virtual page 1.
> 
> As a result, PMBus 1.2+ byte-data status writes from pmbus_core (such as
> clearing individual status bits in pmbus_get_boolean() or clearing
> STATUS_CML faults during probe) on page 2 are sent to the primary VCORE
> client instead of data->vsa, and byte writes on virtual page 1 fall
> through to page 0.
> 
> Implement max16601_write_byte_data() mirroring max16601_read_byte() to
> forward page 2 byte-data writes to data->vsa and reject virtual page 1
> with -EOPNOTSUPP, and reject virtual page 1 in max16601_write_byte() as
> well.
> 
> Fixes: 2138f8853a00 ("hwmon: (pmbus) Driver for Maxim MAX16601")
> Signed-off-by: Arthur Korn <akorn@google.com>

Applied.

Thanks,
Guenter
