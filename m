Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB27358D37;
	Fri,  6 Mar 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803246; cv=fail; b=S5ImzPFPg1Jf/eUaQb6sbbH2sNCU0c0fBQJKpzolgbEnG3hPYgoQnr6S1aMi1iSClUZRmvbc3BPvo7NqD7H4mIgzfNiV+b7s4XE7X1/pRrXiySSFVv4IZErnVU7LV30wvPhjISA8nctsNI/2AXodwJcjSpWbNh2Tc71mUCblWVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803246; c=relaxed/simple;
	bh=EQXYwEznDbqpY/ENN6xp4SYW4U/Z8pWtxAGHNtm1WWk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AIV2TnnOMBEbRGGOKG3peUkT6Avb/4aJVfv68au+rdeOyVoWtPhtxk8UyDth4DUWPd5hk3n+mRtfrivmYV/HNTc0yebl/qMsxw9du31IGdk4YMaLJ2ofdqpisNh/BR5+DQ2sF1ACZCtC1ShNRraMNAp9OFv6Aq1OhlPthGfexLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dHqFllSC; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dHqFllSC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTC+uJimHQFqWbcYLYmsVfTsTwy/ljNcoCzQ5aINGW31Jh5a9FFOgeQ/VlX63wxUjqEAjfGqzKAfjvKgrCZlOLmF+zauT8vv2MeGp+D5HHQI7RHwBYEh9M3dXXdunlpiewELzGQ78evesSCTpjINMPQtpgtYp1DDcCdYMBMz0Be3uFsH5KLi2PZVrMDjxO+v0yek/66f2jWfnS7xQNKIUP/5WT3J60e33nnuITl/jwdfBzHuuLdF8wFHZTEGqk8x22b1IGrgp1r3ezoj+lIybkKrRjr5u6vAe9OxeNHXGjKfbaRsfPhN6hbOxuljUSGbfW9BD4lnM+VIdOOcpOwoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcXckjGNR/qk5SOvARJInWIOjt11JYqtcIYAa6tEiRM=;
 b=Zv2HwecfBxLJQm+iocL0E9WepZIc/n0TDAVBoyohs4h2sLzpcnB580NZISTcXXDG5w60SImK4qM97bjABRl9gwsYGI61fccF9Dt0NtCmdrb7f6fR6JK8a+buOg8CjtuLpg+Ex2Fpt+kwPvrvYxk3/ARygXeKyuMkcj+44gcL3N+KM4W7UIAzYyJq2bHxHetHHDVHzWXjKIvbCvCFDKjuDbf75XLSEv0WJnfiJKLiDxkOF+A38rmqgCFxcLiuNF3Kleus3UA5Dr5UBBNXxhHg3tKOZxrqqNMo+HuClssPxEFmY3fkU272mt/KFk7TQXAcr8JdkP20z3/zNKGYD7xKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcXckjGNR/qk5SOvARJInWIOjt11JYqtcIYAa6tEiRM=;
 b=dHqFllSCYGisCXBtNG7zTgbg3wYM3q0asOQY5V2rOyddKeDWtfjWueYLg6S3xnDChvNEBnZAf+dz4Zz53CSM8wRpaiR5GyNUrzUs5lHWxjCUedXiY3zX/ns5H5eEL0LpbW0h3gHSF6SFMluAcXQIsWcN5vp9GeeJuXMaN7NWwDMafN0EcN3bmma61odFq92GXJ7YteSwb0nSJUiYQ5amkQwVKCreQq0JCxx42NCpN162Z97w152JkGdrryDIPjJoZ4PkCs0AcPuRVN+YgcqvqiTliV9mHU9hva+Cl0j9nnqaV5qDfNPq1GgDA0nZCspl1BfOg6dRMKQz3GkMtnw2FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AS8PR04MB8387.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 13:20:40 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 13:20:40 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [RFC PATCH 0/1] Ensure safe fan state during restart
Date: Fri,  6 Mar 2026 15:34:38 +0200
Message-Id: <20260306133439.564033-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::19) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AS8PR04MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: 2152373a-1a0e-4e08-1127-08de7b8329d1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	C69Q3Q+uURKJWl0JK/9lDafrIzASUQSlLfn61ow4q3YVUBcp5wgbyB2+O+gE+SSH2pdgIu2pELlbDQurmHEjrw+bz9uD9EsUBooQFa0jobwa43d3ux3UtK0r4V5ExqfNuZQ2fWfJCfbiZGTaFn8N2pnOWDDJzqIqS6j4oAXp4bKJR5wMkhpkRSa9ikr6wnlRNssKs1x+4UGtyYXldQbGDn39NRHV8so/0NiKbtzovpC2wb93QqwmmPwq+h/+uM5IjEzbuVnyxHAl1DJAP+h+G5DOpLGaiAe+OCh64LdXl94bZUnnxNFLBYrTSJQDXylkjzJp70u2loQyuIz62w+4vmjI5aZgTZucwzvbfgU0ih7kDiCNEP9B+S41JUG/WTdbFKJVMk8YusUVXBpC+GN074fOGV2pnGCb/1np7yFa/hoPqRIYROGXOhnZYEpWugQvjZgurcICmfi4Wgvasm5mtelJJmDcuA6PWeKJXI2S26PDqOBj2mki6BuDhUU/vy0b6KdYmIFQu9fVRx/rs28XtCBOYOvI739uMVyzyM0IZmG9+76Sx3UWithB8kRx67ct/hLyouPyt/RDL+NHh7eqpiPl2RFQQ/LQjU64AgrDtiG3UcP5QL9MM2hTfU4QFA1xIPMYZWoUUHCEil2yRl1W7hFCceJTinZLw/283Z4DLFMezwsDG+/0dbaaXaQf76z7ldILYPJVyQwnxMVAJsoE4KjYc0MIBmXOND1sSD33fy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Wbm3/kFwHfodtfP+9379ikoCLtSiKLb6nrLiCuA+c9T9w598cajAiOtgCb?=
 =?iso-8859-1?Q?prORt+fbQ9TUMTkkc49EVP6RnHNuOuTneeBD3kocfOaRbrttCzTGpxrsnX?=
 =?iso-8859-1?Q?lr3cAaTAht5/zfRNcE8Cq7pnZyLsq8HBkGzh14QPb0QejsFl1e4NNhEr7F?=
 =?iso-8859-1?Q?vhpq0c+saS3MxFkjVMx1zi8UMqHrmAI2mUwpNEWj6Si3bRb4+S1epTiysh?=
 =?iso-8859-1?Q?OQnO7A5XEbkIDdgj45Y0YOZC6lw+tM3ijN14QuParPoWbCieXKc3ew2wup?=
 =?iso-8859-1?Q?f8c0Rh683kagicCmOdRstOg6Tpku46dknQkwK5o5OghpOyeQD+uKPqvTID?=
 =?iso-8859-1?Q?3+JPnU6tcoHNXuLxL6KybKBqMVUQg3lWbWReH/whSZsb6tHq/ATtg1ZIqi?=
 =?iso-8859-1?Q?1GP8LHsT4SDuDy821To8dC0kLNvnfkfj82gPMwgznLoveC/Q/67CgwpENw?=
 =?iso-8859-1?Q?G3dbvd+9MhFmv5oUtOfppdqyD399JQiRhvUn28rpbXZzvqHo5cpf1PRcHA?=
 =?iso-8859-1?Q?OVTyhOI5hk9jcyccgimvX0ESro8MuPQOM/64fhsSOUqUi5I7/Qd7LgHOtz?=
 =?iso-8859-1?Q?BxNZIwcCMydKzx8eyo96qPylVffZ0e+vXvPc/bbn2JvufqpyjcDVrZYBiO?=
 =?iso-8859-1?Q?0oDD5bV4/H0hahFlKb08QXMLwPcMUdZZv3BDQ3fly2yenvPgw4w48vVkfY?=
 =?iso-8859-1?Q?8CjxTLNuqHQpKLvY4rSnzVinJc5JaD0DGfdfU6WEx+Mc4AN/UW7ec2u9Fq?=
 =?iso-8859-1?Q?2/Cob5xX/6ZTaQmuw5AY6aAvNexa7I9EHL5+9tAy+9HGFsSZu1V1T4v+Q1?=
 =?iso-8859-1?Q?AlICABDoO1hXtXrfmuZ6pjShS95lqlVCpAsgz4HuioAlwMEn18V4E6LPbh?=
 =?iso-8859-1?Q?C82k+nS4A7Vbm5gCv7E5vlXyMXaVpqlCR4OHaa9ycN+2PHdQYHcx0oK/VI?=
 =?iso-8859-1?Q?IJm38WvXlxmKwC9ULN+ODWA5Y+lb233mLbVbP3MBjH+DuCxTWHQJN2SAn5?=
 =?iso-8859-1?Q?6Fq5kIw8UqgUlt3+6RI55SxdGMvZAWEuAzZHl9A4ZBxwK9Sd2MPdTMa2zm?=
 =?iso-8859-1?Q?g9ba3QsjzcqBEq28UtzDiAyXRDp+U0I+L63FZyRNbIOu0mqgWrVKDCAcJc?=
 =?iso-8859-1?Q?dOZUAUCedWwNjb/LsmimmvvbvbgNzHUECwcR/lkqQSYYoXiuj+QMqsb5TW?=
 =?iso-8859-1?Q?DV3GRrBT1YGGXuZ94DMR+ns9pX7Bd8AvF92zHWGYiAkymg1RaM3i/qjX1Z?=
 =?iso-8859-1?Q?UAAyoE8+CJWBlV+A56TAu2TqDQkurAvVMLW+jylru0KaeM/kquaC8CjM3G?=
 =?iso-8859-1?Q?2GK7MofRCMprL+8mMWxVyXqd/8lB5NKPXudzZCyH3W5xpfTgKxijnCu6Hf?=
 =?iso-8859-1?Q?sEYmuS+zsYK3MeinOqhhgOkCWqjcfJaHwDM/JGc4ObMwL6lwzzpxhRNuH/?=
 =?iso-8859-1?Q?Hhy5IFifeUVtCFu0vYtsOBPiie4jNTuxn/Ro4+CdwbqUD3zCIINd5MBlCO?=
 =?iso-8859-1?Q?Wia7kkAUxZGEqWJ4xdasuvUJqRCICiNCrlGZeYpMsoFOuaVx3P8/fPKKQ6?=
 =?iso-8859-1?Q?Ur03plODqoiXI4JJOGGhODLYK7p5IN2ClFxBVA9k10Ek7j3RzwsNO5Adlo?=
 =?iso-8859-1?Q?OucsF2Bb62dbLX7ZXj8OJWn2Ao15JEf1LRM7Ktyr/2P6SL3W7H8LzQfi/R?=
 =?iso-8859-1?Q?47DjFYdOTJu7gmeGXRdApTEkgLhTi/OhQ6tbGSNuy/q/Dnaqj0yFOi3uU/?=
 =?iso-8859-1?Q?gnTN5E/SJSiMb5oq/K42jZXVJWNwg9AF32CYyVtjVFBo9Gf8McWHLQMXTI?=
 =?iso-8859-1?Q?xnpi8YnElw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2152373a-1a0e-4e08-1127-08de7b8329d1
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:20:40.7600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0oOXhiXs3yNdZ8Hwv9gznfMsagQWNX9lbx7GsL0Iik/Vy6piQg2Rm0OgT/5hKSIf6sj+hbKNlSeqz9ok2aYuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8387

From: Florin Leotescu <florin.leotescu@nxp.com>

Hi,

The EMC2305 fan controller retains the last PWM duty cycle programmed
by the kernel until it is reconfigured by another software stage.

During a soft reboot, if the system remains powered while the restart
handoff occurs, the controller may continue driving the fans with the
previously programmed duty cycle. On systems where no later stage
reconfigures the controller promptly, this may leave the fans running
below a desired fail-safe level.

This RFC proposes setting all fan channels to maximum PWM duty cycle
during the driver's shutdown callback so that the controller is left in
a safe cooling state before the restart handoff.

Feedback is welcome on whether this behaviour is appropriate for the
driver or if it should instead be controlled through a platform-specific
mechanism.

Florin Leotescu (1):
  hwmon: emc2305: Set max PWM state during shutdown

 drivers/hwmon/emc2305.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.34.1

