USE [Z_UR_Expose]
GO
CREATE NONCLUSTERED INDEX [demogrphlogschev_intid_idx] ON dbo.Demographic_Log
([Internal_ID] )

CREATE NONCLUSTERED INDEX [ce1_intid_idx] ON [dbo].[urex_ce1] 
([INTERNAL_ID])

CREATE NONCLUSTERED INDEX [ce2_intid_idx] ON [dbo].[urex_ce2] 
([INTERNAL_ID])

CREATE NONCLUSTERED INDEX [dgrsconf_intid_idx] ON [dbo].[urex_degrees_conferred] 
([INTERNAL_ID])

CREATE NONCLUSTERED INDEX [fa_intid_idx] ON [dbo].[urex_fa] 
([INTERNAL_ID])

CREATE NONCLUSTERED INDEX [flcohrt_intid_idx] ON [dbo].[urex_fallcohort] 
([INTERNAL_ID])

