import graphene

from graphql_auth.schema import UserQuery, MeQuery
from django.contrib.auth import get_user_model
from graphene_django import DjangoObjectType
from graphql_auth import mutations

from annonce import models

class AuthMutation(graphene.ObjectType):
    register = mutations.Register.Field()

class Query(UserQuery, MeQuery, graphene.ObjectType):
    pass

class Mutation(AuthMutation, graphene.ObjectType):
    pass

class UserType(DjangoObjectType):
    class Meta:
        model = get_user_model()

class ProfileType(DjangoObjectType):
    class Meta:
        model = models.Profile

class AuthorType(DjangoObjectType):
    class Meta:
        model = models.Profile

class DemandType(DjangoObjectType):
    class Meta:
        model = models.Demand

class Query(UserQuery, MeQuery, graphene.ObjectType):
    all_demands = graphene.List(DemandType)
    author_by_username = graphene.Field(AuthorType, username=graphene.String())
    demand = graphene.Field(DemandType, id=graphene.Int())
    demands_by_author = graphene.List(DemandType, username=graphene.String())
    all_profiles = graphene.List(ProfileType, isDonator=graphene.Boolean())
    # all_profiles = graphene.List(ProfileType)
    profile = graphene.Field(ProfileType, id=graphene.Int())

    def resolve_all_demands(root, info, **kwargs):
        return models.Demand.objects.select_related('author').all()

    def resolve_demand(root, info, **kwargs):
        id = kwargs.get('id')
        if id is not None:
            return models.Demand.objects.select_related('author').get(pk=id)
        return None

    def resolve_author_by_username(root, info, username):
        return models.Profile.objects.select_related('user').get(user__username=username)

    def resolve_demand_by_author(root, info, username):
        return models.Demand.objects.select_related('author').filter(author__user__username=username)

    def resolve_all_profiles(root, info, **kwargs):
        # return models.Profile.objects.select_related('user').all()
        return models.Profile.objects.select_related('user').filter(isDonator=kwargs.get('isDonator'))

    def resolve_profile(root, info, **kwargs):
        id = kwargs.get('id')
        if id is not None:
            return models.Profile.objects.select_related('user').get(pk=id)
        return None

schema = graphene.Schema(query=Query, mutation=Mutation)
