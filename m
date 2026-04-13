Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012040.outbound.protection.outlook.com [40.107.200.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01DA3370FF;
	Mon, 13 Apr 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077210; cv=fail; b=kCBPxwYmqeFNrqe2KF9GWU8FuFyTFSP/6/KZiEB9Em30tPvK9vhm13kAhSI55ULUm3QNpk6Ar+5QjaHreD+hH/+YmkU4QQibdKl7G/sbEwe1VZ4TjtPOx1mW4660oy6EVqFELLNicbp7KEIGbrCtrQ4w3wai9q9cSH/yX20KaW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077210; c=relaxed/simple;
	bh=sBA0TemYlU1QUdMZsAonOgyRPJfHysFvA+c4dluFHHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izcZhe6e4dPxNI9ZoDoXypw5A42IUCnsBtw0j57vIBfcO+RQlkbXxPtSun+kFdca+aEDl9j4q9aeysE/bsNbi3A4HUPa2GlglcQxSOne1j01n2XvfcRafmSLYqY0e5+0PbiX6SN98gxinvc/h91FxflsItwxDLKwLvNZ1TyBmcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X8WzAlfe; arc=fail smtp.client-ip=40.107.200.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X8WzAlfe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzPwDccZhpbjnlBKNnyD+vMhULxXehRgiIsE5XguK2XkE1FEhxZBXJRFfCmO+szPHw5LnUJjB9iT91b3JaMjQnio9K6OYR+ajypYvA/lPxdl33spsSXU3RnjzMjgG4vi5E6RXTwqSpf1VLAImq67jueBa93UrKVOYMAWtoYCAmH9cqeQIR1cLLId3KTEnNNAx8tQ/XZ6XHJ7rUU3TBmbPzjPxS+CDJGoJohaIZ3BlJHrOPcrR5oDPsZCpjRfjgh6fkL1Hub7m/38Uf3J5XZ7cn/GHPTUDq/o50D1s3tgp19y2lImakNPLR5PLKJovL97yMJ4MFKL/IBj7d3qLtC+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KUu3uJpjySvh840nZOY0Y4Dw/uNEqBqy1o4KGTa0uw=;
 b=apzCrjeVnxkty0VHZbVOFlPLShuxFFgKs9hlqlN3Kba7NIm3ZzbPk69rKXYU1JU/sfcMV7R8mOZhlENh2JaMGl/MqoUTeq+y5YGM3T2PBYF5DqN6iMzCWJnQxxQlNn33i+f1ujLKh9EGAtwK9oedyh2Wzrfcy8SCngUyYGq8T9Z2yUw3i5dLMdCes38Kq9BcAVo2Gh0oL06wV3LIVlYhwwso9v4sJ7aoIwZqxv4kSX41nTSRt+C4cX/PCJ2tWqA9eS++8MTvXN1AqxoclY6/EYv2maenXQjLwHrLwrrbSTGVBRh8ajb2hlq5d5FxdohZa0Biz/385r7tJFVd/SxoUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KUu3uJpjySvh840nZOY0Y4Dw/uNEqBqy1o4KGTa0uw=;
 b=X8WzAlfeKBMlLruyf9tWkE5sUUf84rXBEktQNmgV94kapsz412J6tNsIjfuY7VJorOr8lRrE9tU7JWprgUVmAuF4mThnnfiyae95db5IHjjzVzCL7RWKG72IvBqvA+5ctlozbiBNUq2RrAViZdyLygZLCc1vZ7QXSbCttbpQYROf2PSjT/7+86xc4I7eUaOFzU0nHlVbyxPQDZ/+b0efJIr/BQTmOiw90ZlaPUWknKNORfsIH8xWHVDTpWVYT66emUDVqP3JyVVDlpQaeGIiLKKrLrFr1lFY8y8omg0erkACHOf13GHz11x4WKh4i4hcRT0h1S+qLeGdW4cay8jJTQ==
Received: from PH7P220CA0142.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::12)
 by PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 10:46:40 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::d6) by PH7P220CA0142.outlook.office365.com
 (2603:10b6:510:327::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 10:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 10:46:40 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 03:46:21 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 03:46:20 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Apr 2026 03:46:13 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<krzk+dt@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robh@kernel.org>, <sakari.ailus@linux.intel.com>, <smangipudi@nvidia.com>,
	<wsa+renesas@sang-engineering.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Mon, 13 Apr 2026 16:16:12 +0530
Message-ID: <20260413104613.51768-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <3d199d1c-066f-4947-8956-c135fb9ba24e@kernel.org>
References: <3d199d1c-066f-4947-8956-c135fb9ba24e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|PH8PR12MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 46fedcad-a4df-4cbc-d334-08de9949f1f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|1800799024|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	olyL69jlpyOuzOufUr83fsE8GNZg3Auy0nSvGLXGEAfWlFwYqxpJfpj2OOWwEz4s1uPwrac8phYnKvRiLM3MJDnoBTNOcKBIXiXiiDfw7PGk4OflTzuVqv+Bh0Tn0Vq/CHBqB9U0LiGQEJ4Y6yslbHnBMEIHOuDbAPak+ZGikoiQpXwAcjpSvkCIXao3KAt9v+HqOHgtaFO2XYwCgb3W2NLCX009uVbPEgaLsLQ3M/cJXjV57MaB4VC/vamJc20i2C1d4fC7fJOtET+sD3TZMmzMQ1aQYAs3GCgpU8pDXwDU5NkIWmHEn8eERESlt5X4Y3vepl6odyblEhb1+HI2ZxO9Q6gb7mJaTaWJ5iaQ23Z29yTPhklG9vJHsPozNX2dynP0/nfHHjVyP0yYX3EAPUKmnzqKmBxCVf4/ZrsXSyIYjSbVQxvJ8Cp62+2Ke3pSx4VMSkRLv+Smu8iaS0E2/gBd9KzvFlpV/g2KguhK32uljf29vbbrE4EknY/PtTmUKP5Aoi4Fq58UKJyM9QFZG0WHUJDV7kmvBIBSvgMiF9TDbaT0GANAnZxM9O+hOru8KOYlpO/Hhvo1OHnP1ASLctO8HMUzGVvZNFcsUDw0/MnzvDeWQzSSpjz0uBuM/cGwJwQXYXlFp1b17F8rftGA6nsjDKVrqlZgvuFlxc9nYo0RpNU1QjsHpt8LPrQfRYWCu79rlZeN+AklQMRqzZgSvlmHhuIwPhkCuw9FlhNacAPW1RTvAflFM+xaSIMNS/crQPzSN+ujM78vPMk+RLMyuQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(1800799024)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MEwxe89WY7R4sSPcviIzCIpAuh1Qd66/DQN7tK7TIbWagKqlZgzHEAcgd2jK65Dh/GdehCY285XOWn4cf/RR7HdSkW5M1rf2q5lb/jA/7TrWahrQN8oXzwIZtuZVBuSv3jdrLUy6eLaH1PKBDI+53IIh2XJq2IOf8rBKfFKZMshoZiFaG09D2MrgDe25w2/6IZLA7UlBcE/pyCbV7BTuJQzWtmxTaji3waP+b/PoTGpDXVLq4QCQr34hXcCACT5shBBcW2KtkxYUwtu20XH+u07H/n2mXkHdsE7dqhHWtnL/4ocoWZEaquVMtCw5a/byZcdhNnPVA7YGRF+LBAE3bLyESG9uCjdGosDIqgb3FPEZbEFrZOSYJUuuo4MJFc65elfv9Yb11UlQzJvMVCjy9y4gEXWdjX24ON15//v8bCiKAECGkPufMU5utbVHyH9G
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 10:46:40.2940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fedcad-a4df-4cbc-d334-08de9949f1f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7326

On Mon, 13 Apr 2026 09:12:18 +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 08:57, Akhil R wrote:
>>>> Isn't I3C needed for SPD5118. Otherwise I understand even less from this
>>>> rationale - why I3C is being enabled here?
>>>>
>>>> And before author asks what do I want to here: no, it is author's job to
>>>> convince me to accept I3C in defconfig. Not mine.
>>>
>>> BTW, all this was asked at v1 and author did not improve the commit msg
>>> beside giving quite broad/unspecific "Vera".
>> 
>> If I am not wrong, the ask in v1 was to specify the product which this is
>> getting used - 'Vera' it is. I do not know why you would think it is
>> unspecific.
> 
> I already said why. Because I Googled it and Google told me it can be
> "architecture". And no, you do not use SPD5118 on architecture.

Vera is the CPU and it uses SOCAMM LPDDR5, which has an SPD5118 within.
I will write this down in the next version. 

> 
>> 
>> As Thierry and Guenter mentioned, the lack of policy and 'mix of both' in
>> the defconfig makes it quite difficult to understand what could genuinely
>> be convincing other than putting down every little detail or do a trial
>> and error.
> 
> I think the main problem is that people forgot that commits must answer
> WHY you are doing this. Now my assumption is that people sending
> defconfigs do not understand why they are doing it, therefore they
> cannot explain "why" in commit msg.
> 
> Look, find me in following nvidia patches any answers to why this change
> is needed:
> 
> https://lore.kernel.org/all/20260409131340.168556-7-pshete@nvidia.com/
> https://lore.kernel.org/all/20240829134252.49661-1-jonathanh@nvidia.com/
> https://lore.kernel.org/all/20240509215808.126217-1-bwicaksono@nvidia.com/
> 
> I understand that I can clarify what sort of answers to "why?" I expect.
> but lack of such clarification is not excuse to not provide ANY
> explanation in commit msg.
> 
> Basically it is logic like:
> "Uh, I don't how to explain this change, why do we need it, why is it
> good, why am I doing that...anyway, let's send it!"
> 
> Why doing something in the first place if one does not know the reason
> behind?

The answer I wrote to "why" is that "it is required to support the
SOCAMM in Vera". But I may have overlooked the ambiguity of the
details of Vera available online. I will make it more descriptive.

Regards,
Akhil
