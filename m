Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF51A5B8A;
	Fri, 10 Apr 2026 04:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795475; cv=fail; b=logMlbE7X5Y+VPpMN+sjAGN6S20gwHZPFME4kO9Zzm1cCyiZFvL7q0KNtiwgbP0JQGXh6ZyoIC7kTsDO8H+P9mXnmhpoyApWTmQqVzzINfS5JdqvV+/dv7HtnUXmFRtD/croeY4AfDIy1/GKtgZM3ZYTS6EH2pgYGUvH7VgE3FU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795475; c=relaxed/simple;
	bh=y14sohWxmBvhKrMCLfPA2RS4pbMu7RR5aDFOXgWxpg0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tO0QJMzZ1BOciJB7dDoRJJW2OyUpM5s75NoK5Nu0sU95XmB9mTGRf631LSAmb7ggyH/CqDJb30qJmlRRatrA2FLKH4d1RFwtkmUjl9g59punckK6c9eqYX31Ewy6Krb9k5h+jiYjNtWlRvZbO3YMUeu3m8oCXd8P5t+M2mr7njY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=APtvEgc7; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="APtvEgc7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEbO+CznxtGmS+FJ8Wo3wdj6SugSI5rRJ7YE2ErKgfEXmvhtmU7BKUxWZrJzcrP+S+w+OjmBEkyIscMbQE5ut+N9Z2m3vSGx5gC/9X0HFuh8A8RRB4pbOtfTVarTSnwcLF1Ai/8Nw9Urb2QcMoh3iuIdJtU0rQfm/TZ3Yzx0VJabcL6/zWzXDpQ7096Gf4B2CyGUwwWU+04vOtDLnfRrTj7la9RouHVg6QAsTxw0k7m6nAlZ1Y348byRPpMqHn6FBh5PB9pQKBaPFTsleE6YhxK4/10Zn56ZB+e+tLhhJqzlglv4aoGR5XD7Du9/OEpOYXjwOETrs3+vMj0eIUGXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daT8yOBY4AWTfZbC0VBFYvf+8XrBsVWujgROzaAkI3Y=;
 b=ootEDRZaMp8rVaBpnNCkwpJ1MHyGJ5CsxA2KI74qVpsYlK9La/47zucCtiFUIjYwt+Ki5yN0gKvMZjB0pbUnjgtViEFtcB3s/TUsgHRjtLjNp9TuASF9PcWK4MNFlpFi+vztisgxjZBAWWq/ST2GmxgqPYHSVREpaVPRAoNnGl4jt7jovzZ96UfewDxDOhhQhtxJzdDmAAg6oOdHJHoEI5AamxdDiBTMd4xNH71VE9i7RSv6TBKZd61NjSYfwT+yWBtWSct+oVKNg6wWXcqTZr08WRjvI6obYGPj34Vc3GOWEWh888H+17cnrCGW6oFWX5TaduOl00p8yi3vzXowRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daT8yOBY4AWTfZbC0VBFYvf+8XrBsVWujgROzaAkI3Y=;
 b=APtvEgc7rPpCxN7Y3Hi6fwzTF09YqxfF4mQb95DbFxMIHRqge/4kuKOZd7bzVlCmbkGDvic7ALD6nkv9n0inSvw4b1ICJiTJOup+S/lGaOXUVjVAMfXqlN8I+pkk/mEsZ0hjchIJqH1lGs/LqP3XtySGQ9lx2c+3swXI3PGD31iHo4g4PT/ZvQXNU1z4yjkQnPKrLPE8TEjRRJQ2S78hBlzwYIZL+Y7AwkJKN1x8kVJPMBbnlboFE76L71wvhUXHeNiKGVbOqhAzzPglihp3WR7dslLh2XZtG+KQxYtNEJRelCRWajszeqcDwgLgf+Fqz+LJT6CfwGE3y0nCjQmRmQ==
Received: from BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27)
 by CY8PR12MB7241.namprd12.prod.outlook.com (2603:10b6:930:5a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 04:31:02 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::92) by BY3PR04CA0022.outlook.office365.com
 (2603:10b6:a03:217::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 04:31:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 04:31:02 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 21:30:53 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 9 Apr 2026 21:30:53 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 21:30:48 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@nxp.com>
CC: <acpica-devel@lists.linux.dev>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <ebiggers@kernel.org>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robert.moore@intel.com>, <robh@kernel.org>, <sakari.ailus@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
Date: Fri, 10 Apr 2026 10:00:47 +0530
Message-ID: <20260410043047.19675-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <adhZnNozqpW0DaXF@lizhi-Precision-Tower-5810>
References: <adhZnNozqpW0DaXF@lizhi-Precision-Tower-5810>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CY8PR12MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: a537142d-ae36-4dd2-0898-08de96b9f8d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HfznuCmfd3RWsmZJzzf5xZsd0jB2cxzn00oNMIGOP5UmcUxa8pbFJg80pF5/2tR6RmTnyEHm7N2Evwn3p9xBL/sbhIOuEkv9oiTgiJBsQP4Fp+0wVRgNtRqf/dYEOtgMfP2iWsUEzXRV1OGiP0ND0q8YpaU7FaMU+j2X112XrCxjphWYC5ZBT2GPffh/mfOOTGwWhUG6y4mlU1uAIphcJ7MEK+j5f/GuTUJorU9klJWb81Q0fR59tlPUdsyy4p5edAb86jVev7N+81TPGPN7Wz1KftAlapAbt3BmxaKSXFg1vxtu5cmdpSGZOXV24mNGBrXMYY1Kl9U1R/9XwnDRG146yyZjp/hJ//s8lp1g/o0sRjA8Z3IVzCx2bgYriXsdqRIjv9l7HSsUgZJDP6ScFIRNb6DXs9PR9gJCsbAvNqlYH4cyB7XWeagJSWkOif5n1ybLetQQAimYlX9dAZfTWMiJCbXN7j1TkdREZ6yW2L2TWBNscaReNKD9r+VRQ6irxMe4Gd6/I2R+bF+KKvBPwtzy5tt231fXn8MCN8Aj5TGJn8pwvD17cC+cW6OCiHNf4AwRmiCTgPbZ+nPU07J5KsEyhUUEhABLiXf0JGlFQPCWOCSkdqRLHvRcxRRXXUVQqLayuSH+I1FURXxg+3Y9f6W/8jhUgvSJQGgZkLSs3NS7YIOAqOKGLmTXLRMwV2JP41E7qcJmjRU4CsW+bqE1jzVogTAmK7vr48hsILGl3sJ8YCMkmFwPGxm19eN6j1vI5YXagdDtYwXyAYqaUwfSiQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9Omcs2lgnXvzmuX6FjTnGlyA+5Lm23kfoTkaSk/rcTTgDU22yBbirEfpXtxyhiVulpNe2Q20f/HhdDrerL5SQUIOzXZRx0+a9OqThr369RYity8ywbQMENqpYDrGHET/jusAFiTsa8UWnIAl6Br61Fd8U9CBfhs93WGaFq5Li1Z5vRkKvRzAQD5Oo1nHPekSdEsYwPgHfwtycIX/Hzhcae/CSPPr7R5SAe8GsjGeomcDR2FbJU1EIAe51pQkKoab2QoDSalH4bV1PUA8n8lncANroYw+YrGmHYXl4fneXbj2SUWCIQTDW/wWUlHuUPRgjeAxbb5SoAUjKz+oLmyHgWszZOBqZK3fbqfZN5/wOtM+UUNUXSf7r1i+Cg2NxVe8PPTqK6//dZ5+nT4OuC803zxYO+XKAEtXsh9QcRoW9geFl1pGaiut54ZFXjBRXrqQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 04:31:02.0757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a537142d-ae36-4dd2-0898-08de96b9f8d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7241

On Thu, 9 Apr 2026 22:00:39 -0400, Frank Li wrote:
> On Thu, Apr 09, 2026 at 04:27:31PM +0530, Akhil R wrote:
>> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
>> Discovery and Configuration Specification [1] to specify which discovery
>> method an I3C device supports during bus initialization. The property is
>> a bitmap, where a bit value of 1 indicates support for that method, and 0
>> indicates lack of support.
>> Bit 0: SETDASA CCC (Direct)
>> Bit 1: SETAASA CCC (Broadcast)
>> Bit 2: Other CCC (vendor / standards extension)
>> All other bits are reserved.
>>
>> It is specifically needed when an I3C device requires SETAASA for the
>> address assignment. SETDASA will be supported by default if this property
>> is absent, which means for now the property just serves as a flag to
>> enable SETAASA, but keep the property as a bitmap to align with the
>> specifications.
>>
>> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>>
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> ---
>>  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>>  1 file changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> index e25fa72fd785..1705d90d4d79 100644
>> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
>> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
>> @@ -31,10 +31,12 @@ properties:
>>        described in the device tree, which in turn means we have to describe
>>        I3C devices.
>>
>> -      Another use case for describing an I3C device in the device tree is when
>> -      this I3C device has a static I2C address and we want to assign it a
>> -      specific I3C dynamic address before the DAA takes place (so that other
>> -      devices on the bus can't take this dynamic address).
>> +      Other use-cases for describing an I3C device in the device tree are:
>> +      - When the I3C device has a static I2C address and we want to assign
>> +        it a specific I3C dynamic address before the DAA takes place (so
>> +        that other devices on the bus can't take this dynamic address).
>> +      - When the I3C device requires SETAASA for its discovery and uses a
>> +        pre-defined static address.
>>
>>    "#size-cells":
>>      const: 0
>> @@ -147,6 +149,26 @@ patternProperties:
>>            through SETDASA. If static address is not present, this address is assigned
>>            through SETNEWDA after assigning a temporary address via ENTDAA.
>>
>> +      mipi-i3c-static-method:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0x1
>> +        maximum: 0xff
>> +        default: 1
>> +        description: |
>> +          Bitmap describing which methods of Dynamic Address Assignment from a
>> +          static address are supported by this I3C Target. A bit value of 1
>> +          indicates support for that method, and 0 indicates lack of support.
>> +          Bit 0: SETDASA CCC (Direct)
>> +          Bit 1: SETAASA CCC (Broadcast)
>> +          Bit 2: Other CCC (vendor / standards extension)
> 
> You need define at include/dt-bindings/i3c/i3c.h

Ack. Will add these as macros.

> 
> Or direct use string arrray
> anyOf
>   - setdasa
>   - setaasa
>   - vendor

The below thread suggested to keep bitmap since this property comes from
a MIPI specification.
https://lore.kernel.org/linux-i3c/20260318172820.13771-1-akhilrajeev@nvidia.com/T/#m8a6c56cff2bde07b84ebfb403a6ac152da24982e

Best Regards,
Akhil
