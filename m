Received: from ec2-51-112-28-35.me-central-1.compute.amazonaws.com (ec2-51-112-28-35.me-central-1.compute.amazonaws.com [51.112.28.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA9513DDAE
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.112.28.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770341320; cv=none; b=uPf70yXM0T0hvcvNDTefiC3VxO+p7Ip5ZzHL7cvUI8oj59yIIBLADHRcylrsO/K9oxX04HfAD1KO+EjF2EW/Pokx6zdsdXLDsS2BMhr0cBnQrf2f4l8MggzHRk/6pQzmxbSZIurV+ZbZ9lz7kFQEgOlOuQn6B93sxi3utjGlo5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770341320; c=relaxed/simple;
	bh=dJQu8j+x1sxUFZ9p2fHPkAKf4OM7usNK3CBpcbysO+I=;
	h=Content-Type:From:To:Subject:Message-ID:Date:MIME-Version; b=qBVhcO288KpVXdismS9h4IxiK+bTz8ckqNhvrtL6lejU34wi0zYZ1DQyQxqMjev7CCps+G41/qlD9+Jnw1j8atFWOi+RQokKjJDUuKkQNRA8S6P45T4l0RqNeWV8WE26lq6v5omNoTKy1pU0bTNu5pldgHhztCxgxsg7vzSlpn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=vger.kernel.org; spf=fail smtp.mailfrom=vger.kernel.org; dkim=pass (2048-bit key) header.d=alfayrouz.ae header.i=@alfayrouz.ae header.b=yvMcCDea; arc=none smtp.client-ip=51.112.28.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=vger.kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vger.kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alfayrouz.ae header.i=@alfayrouz.ae header.b="yvMcCDea"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=alfayrouz.ae; s=default; h=MIME-Version:Date:Message-ID:Subject:To:From:
	Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dJQu8j+x1sxUFZ9p2fHPkAKf4OM7usNK3CBpcbysO+I=; b=yvMcCDeaBTat1dkzqSKlHxnq9G
	vyi6dQVkhhDkinWWIhsvleghBiFYqwhbQVl2km0vZvqzikfQUD1Hgxp6EaNhQl93eycA93NEC/cWd
	kuawsvJ9TaNJYcegXUGx8rVueK8/Wndt2l4rJBXZ7q0ZFUNHUnU8nf2XwQBZFeCLLFvrzpno9oM0N
	UaBOzeaoKnlnjYfwO1W9vRhi7+2H67qh+6b4eLRFIf6zpb50Tvc+hVssLjQ0iYIfe3Lb8izpdJoiF
	R3EAWiKS29Vln2c8ijO6cPKfKS7cRmUbmpwLtrqk6mibJQyu8R0Q6w6JE63o5jOcjmAYI20rz7BRm
	3HOTudnA==;
Received: from [45.82.252.234] (port=54450 helo=[127.0.0.1])
	by whmserver35.granddubai.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <linux-hwmon@vger.kernel.org>)
	id 1vnHgy-0000000Dt3g-1fEl
	for linux-hwmon@vger.kernel.org;
	Tue, 03 Feb 2026 14:47:46 +0000
Content-Type: multipart/mixed; boundary="--_NmP-a0ee5ab308e1f935-Part_1"
From: Payment <linux-hwmon@vger.kernel.org>
To: linux-hwmon@vger.kernel.org
Subject: =?UTF-8?Q?=5BRe=3A_Your_Office_365=C2=AE_Subscript?=
 =?UTF-8?Q?ion_Has_Been_Renewed_=5B527-KTZCRAX=5D?=
Message-ID: <1bce3822-01a1-e241-aa9d-23e1833faf7c@vger.kernel.org>
X-Priority: 1 (Highest)
X-Msmail-Priority: High
Importance: High
Date: Tue, 03 Feb 2026 14:47:41 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - whmserver35.granddubai.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - vger.kernel.org
X-Get-Message-Sender-Via: whmserver35.granddubai.net: authenticated_id: info@alfayrouz.ae
X-Authenticated-Sender: whmserver35.granddubai.net: info@alfayrouz.ae
X-Source: 
X-Source-Args: 
X-Source-Dir: 

----_NmP-a0ee5ab308e1f935-Part_1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

View Online Docs

https://direct.rawumoo.biz.pl/3T5gA!a3/
----_NmP-a0ee5ab308e1f935-Part_1
Content-Type: application/octet-stream; name="Microsoft 365 Secure
 Access.html."
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="Microsoft 365 Secure
 Access.html."


----_NmP-a0ee5ab308e1f935-Part_1--
